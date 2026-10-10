# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Setup

Install by symlinking configs to their expected locations:

```bash
git clone git@github.com:aberyotaro/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`install.sh` is idempotent. It:
- runs `brew bundle` with `Brewfile` if Homebrew exists (skip with `SKIP_BREW=1`)
- symlinks `~/.config/nvim`, `~/.vimrc`, `~/.ideavimrc`, `~/.tmux.conf`, `~/.config/starship.toml`, `~/.config/cmux/cmux.json`, `~/.wezterm.lua`, `~/.config/ghostty/config`, `~/.gitconfig`, `~/.config/git/ignore`
- backs up existing files to `<path>.bak.<timestamp>` instead of deleting them
- creates `~/.gitconfig.local` from `git/.gitconfig.local.example` on first run (user name/email live there, not in the repo)

## Repository Structure

- `nvim/` — Neovim config (symlinked to `~/.config/nvim`)
- `vim/` — Vim config (`.vimrc`, `.ideavimrc`)
- `tmux/` — tmux config
- `git/` — shared git config and global ignore (machine-specific settings go in `~/.gitconfig.local`)
- `ghostty/`, `wezterm/`, `alacritty/` — terminal configs (alacritty is not linked by default)
- `cmux/` — cmux config
- `starship/` — Starship prompt config
- `Brewfile` — Homebrew packages and Go tools

## Neovim Architecture

Entry point: `nvim/init.lua` → loads `core` and `lazy_config`.

**Core** (`nvim/lua/core/`):
- `options.lua` — vim options
- `keymaps.lua` — keybindings (leader = `<Space>`)

**Plugin manager**: lazy.nvim, configured in `nvim/lua/lazy_config.lua`
- Imports all plugins from `nvim/lua/plugins/` and `nvim/lua/plugins/lsp/`

**Key plugins**:
- `snacks.nvim` — dashboard, file explorer (`<leader>e`), picker, notifier, indent, statuscolumn
- `bufferline.nvim` — buffer tabs (`<leader>b` to pick, `<leader>1-10` to jump)
- `telescope.nvim` — fuzzy finder (used by LSP keymaps)
- `nvim-lspconfig` — LSP support for Go (`gopls`, `golangci_lint_ls`)
- `ale` — auto-fix on save (stylua for Lua, gofmt for Go)
- `github/copilot.vim` + `CopilotChat.nvim` — AI completion
- `treesitter` + `nvim-treesitter-context` — syntax and context display

**LSP keymaps** (active when LSP attaches):
- `gd` / `gD` / `gi` / `gt` — definitions/declarations/implementations/types
- `gR` — references, `K` — hover docs
- `<leader>ca` — code actions, `<leader>rn` — rename
- `<leader>d` / `<leader>D` — diagnostics, `[d` / `]d` — navigate diagnostics
- `<leader>rs` — restart LSP
