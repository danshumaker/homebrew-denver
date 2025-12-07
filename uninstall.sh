#!/usr/bin/env bash
set -euo pipefail

SHUSHOP_VERSION="$(cat "$(dirname "$0")/VERSION" 2>/dev/null || echo 'unknown')"
info "ShuShop version $SHUSHOP_VERSION"
# ---------------- Colors ----------------
if test -t 1 && command -v tput >/dev/null 2>&1; then
  BLUE="$(tput setaf 4)"
  YELLOW="$(tput setaf 3)"
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  RESET="$(tput sgr0)"
else
  BLUE=""
  YELLOW=""
  RED=""
  GREEN=""
  RESET=""
fi

info() { printf "%s[INFO]%s %s\n" "$BLUE" "$RESET" "$*"; }
warn() { printf "%s[WARN]%s %s\n" "$YELLOW" "$RESET" "$*"; }
error() {
  printf "%s[ERROR]%s %s\n" "$RED" "$RESET" "$*"
  exit 1
}
ok() { printf "%s[SUCCESS]%s %s\n" "$GREEN" "$RESET" "$*"; }

# ---------------- Dry-run ----------------
DRYRUN=0
if [[ "${1:-}" == "--dry-run" || "${1:-}" == "-n" ]]; then
  DRYRUN=1
  info "Running uninstall in DRY-RUN mode."
fi

run() {
  if [[ $DRYRUN -eq 1 ]]; then
    echo "DRYRUN: $*"
  else
    eval "$@"
  fi
}

# ---------------- Locate Payload ----------------
command -v brew >/dev/null 2>&1 || error "Homebrew not installed."

PREFIX="$(brew --prefix shushop 2>/dev/null || true)"
[[ -d "$PREFIX" ]] || error "ShuShop payload not found."

PAYLOAD="$PREFIX/share"
BREWFILE="$PAYLOAD/Brewfile"

# ---------------- Remove symlinks (rcdn) -----------
if command -v rcdn >/dev/null 2>&1; then
  info "Removing rcm symlinks..."
  run "rcdn -d \"$PAYLOAD\""
else
  warn "rcdn not found — cannot remove rcup symlinks."
fi

# ---------------- Restore backups ------------------
if [[ -d "$HOME/.old_dots" ]]; then
  LAST_BACKUP="$(ls -1dt "$HOME/.old_dots"/* 2>/dev/null | head -1)"
  if [[ -d "$LAST_BACKUP" ]]; then
    info "Restoring backup from $LAST_BACKUP"
    run "cp -R \"$LAST_BACKUP/.\" \"$HOME/\""
  else
    warn "No backups found inside ~/.old_dots"
  fi
else
  warn "~/.old_dots does not exist; no backups to restore."
fi

# ---------------- Uninstall Brew packages ----------
if [[ -f "$BREWFILE" ]]; then
  info "Removing Brewfile packages..."
  run "brew bundle cleanup --file=\"$BREWFILE\" --force"
else
  warn "Brewfile not found; skipping package removal."
fi

# ---------------- Uninstall Rust -------------------
if command -v rustup >/dev/null 2>&1; then
  info "Removing Rust toolchain..."
  run "rustup self uninstall -y"
fi

# ---------------- Remove formula + tap -------------
info "Uninstalling shushop formula..."
run "brew uninstall shushop || true"

info "Removing tap danshumaker/shushop..."
run "brew untap danshumaker/shushop || true"

ok "ShuShop uninstallation complete."
