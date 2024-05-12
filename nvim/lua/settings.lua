local M = {}

function M.setup()
  -- ui
  vim.opt.termguicolors = true -- 24bitカラーを使用する
  vim.opt.cursorline = true -- カーソル行強調
  vim.wo.number = true -- 行番号表示
  vim.wo.relativenumber = false -- カーソル位置からの行数表示
  vim.opt.shiftwidth = 2 -- シフト幅を2に設定する
  vim.opt.tabstop = 2 -- タブ幅を2に設定する
  vim.opt.expandtab = true -- タブ文字をスペースに置き換える
  vim.opt.autoindent = true -- 自動インデントを有効にする
  vim.opt.smartindent = true -- インデントをスマートに調整する
  vim.opt.wrap = false

  -- file
  vim.opt.fileencoding = "utf-8"
  vim.opt.swapfile = false -- スワップファイルを作成しない
  vim.opt.hidden = true -- 未保存でもバッファを閉じられる

  -- yank/clipboard
  vim.opt.clipboard = "unnamedplus" -- クリップボード共有

  -- command
  vim.opt.wildmenu = true -- コマンドモードの補完ON

  -- search
  vim.opt.hlsearch = true -- ハイライト検索
  vim.opt.incsearch = true -- インクリメンタルサーチ
  vim.opt.matchtime = 1

  -- 言語別の設定
  -- Go
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
      vim.opt.expandtab = false -- タブ文字をスペースに置き換える
      vim.opt.tabstop = 4 -- タブ幅を4に設定する
      vim.opt.softtabstop = 4 -- タブ幅を4に設定する
      vim.opt.shiftwidth = 4 -- シフト幅を4に設定する
    end,
  })
end

return M
