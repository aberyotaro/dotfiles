return {

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").gopls.setup({})
		end,
	},

	-- Completion
	"hrsh7th/nvim-cmp",
	{
		"hrsh7th/cmp-nvim-lsp",
		dependencies = { "hrsh7th/nvim-cmp", "neovim/nvim-lspconfig" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"go",
					"lua",
					"typescript",
					"javascript",
					"json",
					"yaml",
					"html",
					"css",
					"bash",
					"python",
					"markdown",
					"vue",
				},
				highlight = {
					enable = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-refactor",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				refactor = {
					highlight_definitions = {
						-- enable = true,
						clear_on_cursor_move = true,
					},
					highlight_current_scope = {
						enable = false, -- 現在のスコープを強調
					},
					smart_rename = {
						enable = true,
						-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
						keymaps = {
							smart_rename = "grr",
						},
					},
					navigation = {
						enable = true,
						-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
						keymaps = {
							goto_definition = "gnd",
							list_definitions = "gnD",
							list_definitions_toc = "gO",
							goto_next_usage = "<a-*>",
							goto_previous_usage = "<a-#>",
						},
					},
				},
			})
		end,
	},

	-- 見切れた関数名などを表示する
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 5,
				trim_scope = "outer",
				mode = "cursor",
				separator = nil,
			})
		end,
	},

	-- インデントを表示する
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		config = function(_, opts)
			require("ibl").setup(opts)
		end,
	},

	-- 同じ関数名をハイライトする
	{
		"RRethy/vim-illuminate",
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
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
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

	-- Copilot Chat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
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
