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
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml

echo "Success"
