-- nvim/lua/settings.lua
local o = vim.opt

-- 基本オプション
o.number          = true      -- 行番号を表示
o.relativenumber  = true      -- 相対行番号
o.cursorline      = true      -- カーソル行強調
o.termguicolors   = true      -- 24bit カラー

-- インデント設定
o.expandtab       = true      -- タブをスペースに
o.shiftwidth      = 2         -- シフト幅
o.tabstop         = 2         -- タブ幅

-- 検索
o.ignorecase      = true
o.smartcase       = true

-- その他お好みで追加…