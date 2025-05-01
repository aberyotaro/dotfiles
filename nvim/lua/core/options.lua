local o = vim.opt

-- 基本オプション
o.number = true -- 行番号を表示
o.cursorline = true -- カーソル行強調
o.termguicolors = true -- 24bit カラー
o.clipboard:append("unnamedplus")
o.backspace = "indent,eol,start" -- バックスペースの動作を変更
o.history = 1000 -- コマンド履歴の数
o.hlsearch = true -- 検索結果をハイライト

-- インデント設定
o.autoindent = true -- 自動インデント
o.expandtab = true -- タブをスペースに
o.shiftwidth = 2 -- シフト幅
o.tabstop = 2 -- タブ幅

-- 検索
o.ignorecase = true
o.smartcase = true

-- 外観
o.termguicolors = true
o.winblend = 30 -- ウィンドウの不透明度
o.pumblend = 30 -- ポップアップメニューの不透明度
o.signcolumn = "yes" -- サインカラムを常に表示

o.splitright = true -- 右分割を右側に
o.splitbelow = true -- 下分割を下側に

-- その他
-- o.timeoutlen = 500 -- ミリ秒単位。デフォルトは1000（=1秒）
