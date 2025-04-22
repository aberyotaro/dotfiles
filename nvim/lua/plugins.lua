return {
	-- 共通ユーティリティ
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").gopls.setup({})
		end,
	},

	-- Prettier
	{
		"dense-analysis/ale",
		config = function()
			-- Configuration goes here.
			local g = vim.g

			-- 保存時に自動修正を有効にする
			g.ale_fix_on_save = 1
			g.ale_fixers = {
				lua = { "stylua" },
				go = { "gofmt" },
			}
		end,
	},

	-- ファイルエクスプローラー
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- disable default netrw
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			require("nvim-tree").setup({
				view = { width = 30, side = "left" },
				filters = { dotfiles = false },
			})
		end,
	},
	{ "nvim-tree/nvim-web-devicons", opts = {} },

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({
				options = {
					numbers = "ordinal", -- バッファに数字つける "none" / "ordinal" / "buffer_id"
					close_command = "bdelete! %d", -- バッファを閉じるコマンド
					indicator = {
						style = "underline", -- "icon" or "underline"
					},
					buffer_close_icon = "", -- 各バッファの×アイコン
					modified_icon = "●", -- 編集されたバッファのアイコン
					close_icon = "", -- 右端の×アイコン
					left_trunc_marker = "", -- 省略記号
					right_trunc_marker = "",
					max_name_length = 18,
					max_prefix_length = 15,
					tab_size = 18,
					diagnostics = "nvim_lsp", -- LSPの診断を表示するか
					diagnostics_update_in_insert = false,
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
							separator = false,
						},
					},
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					show_tab_indicators = true,
					persist_buffer_sort = true,
					separator_style = "thick", -- "slant", "thick", "thin"
					enforce_regular_tabs = false,
					always_show_bufferline = true,
				},
			})
		end,
	},

	-- status line
	{
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
	},

	-- Git系
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged_enable = true,
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true,
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},
	-- GitHub Copilot
	{
		"github/copilot.vim",
		config = function()
			-- GitHub Copilot の設定（必要に応じて設定）
			vim.g.copilot_no_tab_map = true -- Tab キーの競合を防ぐ
			-- 提案の受け入れ
			vim.api.nvim_set_keymap("i", "<tab>", "copilot#Accept()", { expr = true })
			-- 提案の拒否
			vim.api.nvim_set_keymap("i", "<C-d>", "copilot#Dismiss()", { expr = true })
			-- 提案の表示
			vim.api.nvim_set_keymap("i", "<C-n>", "copilot#Next()", { expr = true })
		end,
	},

	-- テーマ
	{ "yasukotelin/retrohack" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				style = "night",
			})
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},

	-- nvim-surround
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
}
