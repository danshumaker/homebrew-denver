# AGENTS.md

## Context: Denver – Developer Environment Manager
This file captures distilled context from prior work ("Tool manager architecture" thread) relevant to the Denver project.

### Core Concept
- Denver (formerly referenced as ShuShop/homebrew-shushop) is a **manager-of-managers**: it documents, installs, uninstalls, and audits developer tools across multiple install methods (brew, curl | bash, custom installers, language managers, etc.).
- The system needs a **single source of truth (SSOT)** registry that describes each tool with:
  - one-line description
  - install method + command or formula
  - verification command
  - uninstall method
  - owned dotfiles
  - flags like `homebrew` / `rcm`

### Proposed Registry (SSOT)
- Location: `~/.shushop/registry.json` (naming can be adjusted for Denver).
- Example entry fields:
  - `description`, `category`
  - `install` (method: brew/curl/custom + details)
  - `verify` (binary + version command)
  - `uninstall` (method + command)
  - `dotfiles` (owned paths)
  - `homebrew` / `rcm` booleans

### CLI Surface Area (Target Commands)
- `denver install`: install all tools per registry; log installs; warn if dotfiles exist but tool missing.
- `denver uninstall`: uninstall per registry; remove/adjust rcm symlinks; remove non-rcm directories as appropriate; log actions.
- `denver audit`: reconcile registry vs machine state; report discrepancies (dotfiles vs installed vs brew state).
- `denver docs`: generate one-line docs per tool from registry (e.g., `SOFTWARE.md`).

### Dotfile Insight
- Presence of a directory (e.g., `~/.cargo`) **does not mean** the tool is installed correctly.
- rcm tracks *configuration files*, not *installation state*.
- Use the registry + verification commands to determine actual install status.

### Dotfile Classification (Guidance)
- **Brew-managed tools (configs still in rcm)**: e.g., fzf, git, ripgrep, tmux, go, docker, vscodium, etc.
- **Non-brew tools needing explicit management**: e.g., cargo/rustup, some language managers, custom installers.
- **Noise/ephemeral files** to avoid in rcm: `.DS_Store`, `.bash_history`, `.viminfo`, `.lesshst`, `.rnd`, `.Xauthority`, etc.

### Registry-First Workflow
- Generate a draft registry by scanning:
  - Brewfile formulas
  - dotfiles under `~/`
  - binaries on PATH
- Manually refine descriptions + verify/uninstall steps.
- Optionally generate Brewfile from registry (registry remains SSOT).

### Homebrew Formula Guidance
- Formula should include a **literal version string**, e.g.:
  - `version "2025-12-10_15_55_42"`
- Description example: `desc "Developer Environment Manager"`.

### Release/Distribution Notes
- Prefer GitHub **release assets** and `gh release download` over tag tarballs to avoid caching pitfalls.
- Fixed asset filename improves install UX; use the release asset API/`gh` to avoid stale cache issues.

### Release Process Adjustment (2026-02-06)
- `ui --bump` no longer edits `Formula/denver.rb` locally.
- Formula version/sha updates are now owned by GitHub Actions on tag push.
- This prevents merge conflicts between local updates and CI updates.

### GitHub Access Troubleshooting (Historical)
- Clone failures were due to **SSH auth** while a PAT was provided.
- Fixes:
  - Force HTTPS in `gh` (`gh config set git_protocol https` + `gh auth setup-git`).
  - Or correctly install and authorize SSH keys with GitHub.
