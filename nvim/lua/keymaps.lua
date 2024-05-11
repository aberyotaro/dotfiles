local map = vim.keymap.set

-- common setting
map("i", "jj", "<ESC>")

-- fotmatter
map("n", "<leader>f", ":Format<CR>")
map("n", "<leader>F", ":FormatWrite<CR>")
