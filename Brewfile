# brew bundle --file=~/.dotfiles/Brewfile
# 依存で入るライブラリ（glib, cairo など）は書かない。直接使うものだけ。

# --- editor / terminal ---
brew "neovim"
brew "vim"
brew "tmux"
brew "starship"
cask "ghostty"
cask "wezterm"

# --- fonts ---
cask "font-plemol-jp-nf"
cask "font-fira-code"

# --- git ---
brew "git"
brew "gh"
brew "ghq"
brew "lazygit"

# --- CLI ---
brew "ripgrep"
brew "fzf"
brew "bat"
brew "jq"
brew "tree"
brew "zsh-syntax-highlighting"

# --- runtime ---
# Node は nvm に一本化（n と併用していたのを整理）
brew "nvm"

# --- Go tools ---
# gopls / golangci-lint は Neovim の mason が入れるのでここでは管理しない。
# go が PATH に無いとスキップされる。
go "github.com/go-delve/delve/cmd/dlv"
go "mvdan.cc/gofumpt"
go "golang.org/x/tools/cmd/goimports"
go "honnef.co/go/tools/cmd/staticcheck"
go "golang.org/x/vuln/cmd/govulncheck"
go "gotest.tools/gotestsum"
go "go.uber.org/mock/mockgen"
go "github.com/josharian/impl"
go "github.com/fatih/gomodifytags"
go "github.com/cweill/gotests/gotests"
