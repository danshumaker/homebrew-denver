#!/usr/bin/env bash
# Denver Uninstall ( https://github.com/danshumaker/homebrew-denver )
set -euo pipefail

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

# ---------------- Uninstall Rust -------------------
un_rust() {
  if command -v rustup >/dev/null 2>&1; then
    info "Removing Rust toolchain..."
    run "rustup self uninstall -y"
  fi
}

main() {

  un_rust
  ok "Denver Uninstallation Complete."
}

main "$@"
