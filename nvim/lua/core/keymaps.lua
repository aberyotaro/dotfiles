-- リーダーキーをスペース設定
vim.g.mapleader = " "

local keymap = vim.keymap

-- Insert mode
keymap.set("i", "jj", "<Esc>", { desc = "Insert mode to Normal mode" })
keymap.set("i", "jk", "<Esc>:w<CR>", { desc = "Insert mode to Normal mode and save" })
keymap.set("i", "<C-b>", "<Esc>^i", { desc = "Move to the beginning of the line" })
keymap.set("i", "<C-e>", "<End>", { desc = "Move to the end of the line" })
keymap.set("i", "<C-h>", "<Left>", { desc = "Move to the left" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move to the down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move to the up" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move to the right" })

-- Search
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize window size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab Management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabhew %<CR>", { desc = "Open current buffer in new tab" })

-- Bufferline
keymap.set("n", "<leader>b", ":BufferLinePick<CR>", { desc = "BufferLine pick" })
for i = 1, 10 do
	keymap.set(
		"n",
		"<leader>" .. i,
		":BufferLineGoToBuffer " .. i .. "<CR>",
		{ desc = "BufferLine go to buffer " .. i }
	)
end

-- copilot
vim.api.nvim_set_keymap("i", "<tab>", "copilot#Accept()", { expr = true }) -- Copilot で提案を受け入れる
