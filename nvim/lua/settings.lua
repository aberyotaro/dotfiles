local M = {}

function M.setup()
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.opt.clipboard = "unnamedplus"
end

return M
