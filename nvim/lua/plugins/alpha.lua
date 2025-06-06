return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "󰈙 New file", "<cmd>ene<CR>"),
			dashboard.button("SPC ff", "󰈞 Find file", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fr", "󰝰 Recent files", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("SPC fs", "󰈞 Find string", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰦛 Restore session for cwd", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", " Quit Neovim", "<cmd>qa<CR>"),
		}

		alpha.setup(dashboard.opts)
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
