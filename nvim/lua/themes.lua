-- 使用したいテーマ名をここで切り替え
local theme = "tokyonight"

-- 各テーマ固有のオプション設定
if theme == "tokyonight" then
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_functions = true
elseif theme == "catppuccin" then
  require("catppuccin").setup({ flavour = "mocha" })
elseif theme == "gruvbox" then
  vim.g.gruvbox_flat_style = "dark"
  vim.cmd([[autocmd VimEnter * colorscheme gruvbox]])
  return
end

-- 最後に colorscheme コマンドで反映
vim.cmd(("colorscheme %s"):format(theme))