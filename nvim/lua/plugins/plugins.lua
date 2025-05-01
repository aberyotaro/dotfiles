return {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").gopls.setup({})
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
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
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
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
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "┊" },
		},
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
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
}
