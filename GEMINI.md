# Project Overview

This project is a [Homebrew](https://brew.sh/) tap for managing dotfiles and development environment setup. It appears to be a personal collection of configurations and scripts for various development tools. The core of the project is the `denver` formula, which installs the dotfiles and a `Brewfile` containing a comprehensive list of development tools.

The project is managed using `rcm`, a dotfile manager. The `dotfiles` directory contains configurations for tools like `bash`, `git`, `neovim`, `tmux`, and more. The `Brewfile` includes a wide range of packages, from command-line utilities to development languages and GUI applications, indicating a setup for a full-stack developer.

# Building and Running

This project is a Homebrew tap, so it's not "built" in the traditional sense. It's used by tapping the repository and installing the `denver` formula.

**To install the `denver` formula:**

```bash
brew tap danshumaker/denver
brew install denver
```

**To install the packages listed in the `Brewfile`:**

```bash
brew bundle --file=dotfiles/Brewfile
```

*TODO: Verify the exact commands for using this tap, as they are not explicitly stated.*

# Development Conventions

The `DEV_NOTES.md` file contains a large amount of information about the user's personal development conventions. Some key takeaways are:

*   **Dotfile Management:** `rcm` is used for managing dotfiles.
*   **Vim/Neovim:** Extensive notes on Neovim configuration, plugins (like Fugitive, FZF), and keybindings.
*   **Git:** A comprehensive list of git aliases and commands for various workflows, including diffing, patching, and interactive rebasing.
*   **Tmux:** Configuration and keybindings for `tmux` sessions, windows, and panes.
*   **Composer and NPM:** Notes on managing PHP and Node.js dependencies.
*   **Shell:** The user uses `bash` and has a customized profile with aliases and functions.

The project has a clear structure for managing dotfiles and seems to be well-documented for personal use. The `DEV_NOTES.md` file is the primary source of information about the project's conventions and usage.
