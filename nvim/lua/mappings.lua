require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "toggle nvimtree" })
map("n", "<leader>1", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>2", ":Telescope live_grep<CR>", { desc = "telescope live_grep" })
