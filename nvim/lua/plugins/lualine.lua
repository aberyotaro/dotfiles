-- status line
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-tree/nvim-tree.lua" },
	config = function()
		require("lualine").setup({})
		-- BufEnter で動的に laststatus を制御
		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			callback = function()
				if vim.bo.filetype == "NvimTree" then
					vim.opt.laststatus = 0
				else
					vim.opt.laststatus = 2
				end
			end,
		})
	end,
}
