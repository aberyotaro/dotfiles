local M = {}

function M.on_lsp_attach(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  -- デバッグ用
  vim.keymap.set("n", "<F5>", require("dap").continue, opts)
  vim.keymap.set("n", "<F10>", require("dap").step_over, opts)
  vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap=true, silent=true })
  vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap=true, silent=true })
end

-- 全体設定
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

return M
