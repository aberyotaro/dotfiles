-- status line
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})

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
