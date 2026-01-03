# Denver - Developer Environment Manager

<p align="center">
  <!-- Homebrew Formula Checker -->
  <img alt="Homebrew Formula" src="https://img.shields.io/badge/homebrew-tap-blue?logo=homebrew">

</p>

### Intent/Purpose: New Machine Developer Setup

- Denver is a dotfile and developer tool setup system initially designed for new user account setup.
- It assumes that close to nothing is installed (not git, not Xcode, not node, etc)
- It is designed to do all the downloading and installation for you.
- Installation requires curl and the internet.

### Features & Installations

- Dotfiles managed by git(via homebrew) and setup by [RCM](https://github.com/thoughtbot/rcm)
- Tools managed by [Homebrew](https://brew.sh/) (Currently installs 131 tools via homebrew)
- [Cargo](https://doc.rust-lang.org/cargo/index.html) The rust package manager
- All Nerd Fonts (via homebrew) - these make nvim and the terminal (and tmux) nicer.
- Dry-run mode (just output with no execution)
- Dotfile backup into .old_dots/ BEFORE installation

### Install & Uninstall

The ui script has all the options. You can install/uninstall individual assets or everything.
See `ui -h` for all the help and options.

### Security Notes

- Homebrew handles checksum verification for the formula tarball.
- No checksum logic is included in the scripts.
- All system changes are reversible.
- Backups protect all user-modified dotfiles before linking.

#### Bundle Updates

```bash
brew bundle dump --describe --force --taps --brews --casks
```

NOTE: If you update the Brewfile then make sure you take out the denver formula from it.

##### TODO

- ui :    Authentication runs/fixes/settings
  - npm token
  - gh token and Authentication
  - 1pass-cli setup
- Make private using github tokens.

#### License

MIT License — Do whatever you want, just don’t blame me.
