local opts = { noremap = true, silent = true }

vim.keymap.set("i", "jj", "<Esc>", opts)
vim.keymap.set("i", "jk", "<Esc>:w<CR>", opts)
vim.keymap.set("i", "<C-b>", "<Esc>^i", opts)
vim.keymap.set("i", "<C-e>", "<End>", opts)
vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Nop>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)

vim.keymap.set("n", "<leader>h", "<C-w>h", opts)
vim.keymap.set("n", "<leader>l", "<C-w>l", opts)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", opts)
vim.keymap.set("n", "<leader>t", ":NvimTreeFocus<CR>", opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Copilot
vim.api.nvim_set_keymap('i', '<tab>', 'copilot#Accept()', { expr = true }) -- Copilot で提案を受け入れる

