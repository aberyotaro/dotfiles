local map = vim.keymap.set

-- common setting
map("i", "jj", "<ESC>", { silent = true })
map("n", "<C-s>", ":w<CR>", { silent = true })

-- fotmatter
map("n", "<C-f>", ":Format<CR>", { silent = true })
-- map("n", "<C-F>", ":FormatWrite<CR>", { silent = true })

-- nvim-tree
map("n", "<C-t>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<C-t>f", ":NvimTreeFindFile<CR>", { silent = true })

-- window/pane
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-q>", "<C-w>q", { silent = true })

-- telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true })
