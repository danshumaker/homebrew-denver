#!/usr/bin/env bash
set -euo pipefail

SHUSHOP_VERSION="$(cat "$(dirname "$0")/VERSION" 2>/dev/null || echo 'unknown')"
info "ShuShop version $SHUSHOP_VERSION"
# ---------------- Color Support ----------------
if test -t 1 && command -v tput >/dev/null 2>&1; then
  COLOR_BLUE="$(tput setaf 4)"
  COLOR_YELLOW="$(tput setaf 3)"
  COLOR_RED="$(tput setaf 1)"
  COLOR_GREEN="$(tput setaf 2)"
  COLOR_RESET="$(tput sgr0)"
else
  COLOR_BLUE=""
  COLOR_YELLOW=""
  COLOR_RED=""
  COLOR_GREEN=""
  COLOR_RESET=""
fi

info() { printf "%s[INFO]%s %s\n" "$COLOR_BLUE" "$COLOR_RESET" "$*"; }
warn() { printf "%s[WARN]%s %s\n" "$COLOR_YELLOW" "$COLOR_RESET" "$*"; }
error() {
  printf "%s[ERROR]%s %s\n" "$COLOR_RED" "$COLOR_RESET" "$*"
  exit 1
}
ok() { printf "%s[SUCCESS]%s %s\n" "$COLOR_GREEN" "$COLOR_RESET" "$*"; }

# ---------------- Dry-run mode ----------------
DRYRUN=0
if [[ "${1:-}" == "--dry-run" || "${1:-}" == "-n" ]]; then
  DRYRUN=1
  info "Running in DRY-RUN mode — no commands will be executed."
fi

run() {
  if [[ $DRYRUN -eq 1 ]]; then
    echo "DRYRUN: $*"
  else
    eval "$@"
  fi
}

# ---------------- Detect OS -------------------
OS="$(uname -s)"
case "$OS" in
  Darwin) PLATFORM="macos" ;;
  Linux) PLATFORM="linux" ;;
  *) error "Unsupported OS: $OS" ;;
esac
info "Platform: $PLATFORM"

# ---------------- Homebrew Install --------------
if ! command -v brew >/dev/null 2>&1; then
  info "Installing Homebrew..."
  run 'NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
else
  info "Homebrew already installed."
fi

# Load brew shellenv
run 'eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || true)"'
run 'eval "$(/usr/local/bin/brew shellenv 2>/dev/null || true)"'
run 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv 2>/dev/null || true)"'

# ---------------- Tap + Install formula ----------
info "Tapping danshumaker/shushop..."
run "brew tap danshumaker/shushop"

info "Installing shushop formula..."
run "brew install shushop || true"

PAYLOAD="$(brew --prefix shushop)/share"
BREWFILE="$PAYLOAD/Brewfile"

[[ -f "$BREWFILE" ]] || error "Brewfile not found at $BREWFILE"

# ---------------- Backup dotfiles ----------------
BACKUP_DIR="$HOME/.old_dots/backup_$(date +%Y%m%d_%H%M%S)"
run "mkdir -p \"$BACKUP_DIR\""

info "Backing up existing dotfiles..."

for f in .bash_profile .bashrc .zshrc .gitconfig; do
  if [[ -e "$HOME/$f" ]]; then
    run "mv \"$HOME/$f\" \"$BACKUP_DIR/\""
  fi
done

# ---------------- Brew bundle --------------------
info "Running brew bundle..."
run "brew tap homebrew/bundle || true"
run "brew bundle --file=\"$BREWFILE\""

# ---------------- rcup deployment ----------------
info "Running rcup..."
run "rcup -d \"$PAYLOAD\""

# ---------------- Fix permissions -----------------
OP_DIR="$HOME/.dotfiles/config/op"
OP_CFG="$OP_DIR/config"

if [[ -d "$OP_DIR" ]]; then
  info "Fixing .dotfiles op config permissions..."
  run "sudo chmod 700 \"$OP_DIR\""
  if [[ -f "$OP_CFG" ]]; then run "sudo chmod 600 \"$OP_CFG\""; fi
fi

# ---------------- Install Rust --------------------
if ! command -v cargo >/dev/null 2>&1; then
  info "Installing Rust toolchain..."
  run 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y'
else
  info "Rust already installed."
fi

# ---------------- Install Fonts (macOS only) -------
if [[ "$PLATFORM" == "macos" ]]; then
  FONT_SRC="/Applications/Utilities/Terminal.app/Contents/Resources/Fonts"
  if [[ -d "$FONT_SRC" ]]; then
    info "Installing Terminal fonts..."
    run "sudo cp -R \"$FONT_SRC/.\" \"/Library/Fonts/\""
  else
    warn "Terminal fonts not found at $FONT_SRC"
  fi
fi

ok "ShuShop installation complete."
