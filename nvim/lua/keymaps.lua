local map = vim.keymap.set

-- common setting
map("i", "jj", "<ESC>", { silent = true })
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("n", "<C-s>", "<cmd>w<CR>", { silent = true })

-- fotmatter
map("i", "<C-f>", "<ESC>:Format<CR>", { silent = true })

-- nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<C-f>", ":NvimTreeFindFile<CR>", { silent = true })

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
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", { silent = true })
vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true })
vim.keymap.set("n", "<leader>gs", ":Telescope git_status<CR>", { silent = true })
