#!/bin/bash

# 現在のディレクトリを保存
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# NvChadの設定ディレクトリへのシンボリックリンク
if [ ! -d "~/.config/nvim" ]; then
  ln -s $DIR/../nvim ~/.config/nvim
  echo "Linked NvChad configuration."
else
  echo "NvChad configuration already linked."
fi

# その他の設定ファイルのシンボリックリンク
#ln -sf $DIR/zsh/.zshrc ~/.zshrc
#ln -sf $DIR/zsh/.zprofile ~/.zprofile
#ln -sf $DIR/git/.gitconfig ~/.gitconfig
#ln -sf $DIR/git/.gitignore_global ~/.gitignore_global
#ln -sf $DIR/tmux/.tmux.conf ~/.tmux.conf
#ln -sf $DIR/tmux/.tmux.conf.local ~/.tmux.conf.local

echo "Success"
