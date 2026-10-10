# dotfiles

## install

```bash
git clone git@github.com:aberyotaro/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

- `Brewfile` のパッケージも入る（Homebrew が無い / `SKIP_BREW=1` ならスキップ）
- 既存の設定ファイルは削除せず `*.bak.<日時>` に退避する
- 初回は `~/.gitconfig.local` が作られるので name / email を編集する
