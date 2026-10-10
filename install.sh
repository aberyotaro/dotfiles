#!/bin/bash

# 途中でコケたら即終了
set -euo pipefail

# dotfiles ディレクトリ
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_SUFFIX=".bak.$(date +%Y%m%d%H%M%S)"

# $1 (dotfiles内のパス) -> $2 (リンク先) にシンボリックリンクを張る。
# 既にこのdotfilesを指すリンクなら何もしない（冪等）。
# 既存のファイル/ディレクトリ/別のリンクがあれば削除せず .bak.<日時> に退避する。
link() {
    local src="$DOTFILES_DIR/$1"
    local dst="$2"

    mkdir -p "$(dirname "$dst")"

    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        echo "  ok      $dst"
        return
    fi

    if [ -e "$dst" ] || [ -L "$dst" ]; then
        mv "$dst" "$dst$BACKUP_SUFFIX"
        echo "  backup  $dst -> $dst$BACKUP_SUFFIX"
    fi

    ln -s "$src" "$dst"
    echo "  link    $dst"
}

# Homebrew があれば Brewfile のパッケージを入れる。
# 社用PCなどで brew が使えない場合や SKIP_BREW=1 のときはスキップ。
if [ "${SKIP_BREW:-0}" != "1" ] && command -v brew >/dev/null 2>&1; then
    echo "Installing packages from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile" || echo "  brew bundle に失敗したものがあります（続行します）"
else
    echo "Skipping Brewfile (brew not found or SKIP_BREW=1)"
fi

echo "Linking configs..."
link nvim                   "$HOME/.config/nvim"
link vim/.vimrc             "$HOME/.vimrc"
link vim/.ideavimrc         "$HOME/.ideavimrc"
link tmux/.tmux.conf        "$HOME/.tmux.conf"
link starship/starship.toml "$HOME/.config/starship.toml"
link cmux/cmux.json         "$HOME/.config/cmux/cmux.json"
link wezterm/wezterm.lua    "$HOME/.wezterm.lua"
link ghostty/config         "$HOME/.config/ghostty/config"
link git/.gitconfig         "$HOME/.gitconfig"
link git/ignore             "$HOME/.config/git/ignore"
# link alacritty/alacritty.toml "$HOME/.config/alacritty/alacritty.toml"

# 名前・メールアドレスなどマシン固有の git 設定はリポジトリ外に置く
if [ ! -e "$HOME/.gitconfig.local" ]; then
    cp "$DOTFILES_DIR/git/.gitconfig.local.example" "$HOME/.gitconfig.local"
    echo "  created $HOME/.gitconfig.local（name / email を編集してください）"
fi

# agent-skills リポジトリがあれば、そちらの install.sh も呼んで skill の symlink を張る。
# 場所は AGENT_SKILLS_DIR で変更できる。
AGENT_SKILLS_DIR="${AGENT_SKILLS_DIR:-$HOME/src/github.com/aberyotaro/agent-skills}"
if [ -x "$AGENT_SKILLS_DIR/install.sh" ]; then
    echo "Linking agent skills..."
    "$AGENT_SKILLS_DIR/install.sh"
else
    echo "Skipping agent skills (not found: $AGENT_SKILLS_DIR)"
fi

echo "Success"
