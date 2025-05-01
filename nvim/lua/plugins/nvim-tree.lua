-- ファイルエクスプローラー
return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- disable default netrw
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			require("nvim-tree").setup({
				view = {
					width = 35,
					relativenumber = true,
				},
				renderer = {
					indent_markers = {
						enable = true,
					},
				},
				filters = {
					custom = {
						".DS_Store",
					},
				},
				git = {
					ignore = false,
				},
			})
			-- NvimTree
			local keymap = vim.keymap
			keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
			keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Find file in NvimTree" })
			keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse NvimTree" })
			keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })
		end,
	},
	{ "nvim-tree/nvim-web-devicons", opts = {} },
}
