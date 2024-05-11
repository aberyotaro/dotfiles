return {
  "nvim-lua/plenary.nvim",
  { "folke/neodev.nvim", opts = {} },
  -- lsp/dap
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup(require "configs.mason-lspconfig")
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },

  -- formatter
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup(require "configs.formatter")
    end,
  },

  -- file
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup(require "configs.nvim-tree")
    end,
  },

  -- fzf
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- editor
  {
    "RRethy/vim-illuminate", -- highlight word under cursor
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- syntax
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup(require "configs.nvim-treesitter")
    end,
  },

  -- completion
  {
    "github/copilot.vim",
  },
}
