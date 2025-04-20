#!/bin/bash

# 途中でコケたら即終了
set -e

# dotfiles ディレクトリ
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Neovimの設定をリンク
echo "Linking Neovim config..."
# 既存の ~/.config/nvim を削除
if [ -L "$HOME/.config/nvim" ] || [ -d "$HOME/.config/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
fi
# nvimのシンボリックリンクを作成
ln -s "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/vim/.vimrc"   "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/vim/.ideavimrc" "$HOME/.ideavimrc"
echo "✅ Linked: $HOME/.config/nvim → $DOTFILES_DIR/nvim"

# その他の設定ファイルのシンボリックリンク
# ln -sf "$DOTFILES_DIR/zsh/.zprofile"          "$HOME/.zprofile"
# ln -sf "$DOTFILES_DIR/git/.gitconfig"         "$HOME/.gitconfig"
# ln -sf "$DOTFILES_DIR/git/.gitignore_global"  "$HOME/.gitignore_global"
# ln -sf "$DOTFILES_DIR/tmux/.tmux.conf"        "$HOME/.tmux.conf"
# ln -sf "$DOTFILES_DIR/tmux/.tmux.conf.local"  "$HOME/.tmux.conf.local"

echo "Success"
