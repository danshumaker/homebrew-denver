# Denver - Developer Environment Manager

<p align="center">

  <!-- Latest Version Tag -->
  <img alt="Version" src="https://img.shields.io/github/v/tag/danshumaker/homebrew-denver?label=version&color=blue">

  <!-- Release Date -->
  <img alt="Release Date" src="https://img.shields.io/github/release-date/danshumaker/homebrew-denver?color=blueviolet">

  <!-- Build Status -->
  <img alt="Build Status" src="https://img.shields.io/github/actions/workflow/status/danshumaker/homebrew-denver/bump.yml?label=CI">

  <!-- License -->
  <img alt="License" src="https://img.shields.io/github/license/danshumaker/homebrew-denver">

  <!-- GitHub Repo Size -->
  <img alt="Repo Size" src="https://img.shields.io/github/repo-size/danshumaker/homebrew-denver">

  <!-- Total Downloads -->
  <img alt="Downloads" src="https://img.shields.io/github/downloads/danshumaker/homebrew-denver/total?color=brightgreen">

  <!-- Homebrew Formula Checker -->
  <img alt="Homebrew Formula" src="https://img.shields.io/badge/homebrew-tap-blue?logo=homebrew">

</p>

### New Machine Developer Setup

- Denver is a dotfile and developer tool setup system initially designed for new user account setup.
- It assumes that close to nothing is installed (not git, not Xcode, not node, etc)
- It is designed to do all the downloading and installation for you.
- Installation requires curl and the internet.

### Features & Installations

- Dotfiles managed by git(via homebrew) and setup by [RCM](https://github.com/thoughtbot/rcm)
- Tools managed by [Homebrew](https://brew.sh/)
- [Cargo](https://doc.rust-lang.org/cargo/index.html) The rust package manager
- All Nerd Fonts (via homebrew)
- Dry-run mode (just output with no execution)
- Dotfile backup into .old_dots/ BEFORE installation

### Instal & Uninstall

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/danshumaker/homebrew-denver/main/install.sh)"
```

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/danshumaker/homebrew-denver/main/uninstall.sh)"
```

### Homebrew Formula Behavior

The formula:

- **Does not** perform installation work
- **Does not** modify `$HOME`
- **Does not** call external scripts
- **Only** installs payload files into:

```
$(brew --prefix denver)/share
```

This keeps Homebrew happy while giving your installer script full control.

### Security Notes

- Homebrew handles checksum verification for the formula tarball.
- No checksum logic is included in the scripts.
- All system changes are reversible.
- Backups protect all user-modified dotfiles before linking.

---

### Developer Notes

Make repo private for the time being:

```bash
gh repo edit --visibility private --
```

Useful commands during development:

```bash
brew uninstall denver
brew untap danshumaker/denver
brew tap --repair
brew tap danshumaker/denver
brew install denver
```

Print formula payload path:

```bash
brew --prefix denver
```

#### Dry-run Mode (safe preview)

You can simulate the entire installation without touching your system:

```bash
/bin/bash install.sh --dry-run
```

or

```bash
/bin/bash install.sh -n
```

Dry-run prints each command instead of executing it
---

#### License

MIT License — Do whatever you want, just don’t blame me.

---

##### TODO

- denver.py script: Show list of NON-tracked dot files with explainations why they are not tracked.
- install.sh :    Authentication runs/fixes/settings
  - npm token
  - gh token and Authentication
  - 1pass-cli setup
- Linux & Windows suport
- release to public (make user agnostic)
