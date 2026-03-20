# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Setup

Install by symlinking configs to their expected locations:

```bash
git clone git@github.com:aberyotaro/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`install.sh` creates symlinks for: `~/.config/nvim`, `~/.vimrc`, `~/.ideavimrc`, `~/.tmux.conf`, `~/.config/alacritty/alacritty.toml`, `~/.config/starship.toml`, `~/.wezterm.lua`

## Repository Structure

- `nvim/` — Neovim config (symlinked to `~/.config/nvim`)
- `vim/` — Vim config (`.vimrc`, `.ideavimrc`)
- `tmux/` — tmux config
- `alacritty/` — Alacritty terminal config
- `wezterm/` — WezTerm terminal config
- `starship/` — Starship prompt config

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
