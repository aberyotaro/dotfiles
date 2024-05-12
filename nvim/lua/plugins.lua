return {
  "nvim-lua/plenary.nvim",
  { "folke/neodev.nvim", opts = {} },
  -- lsp/dap
  {
    "williamboman/mason.nvim",
    opts = function()
      require "configs.mason"
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

  -- file explorer
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
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
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

  -- git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
  },

  -- theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup {
        style = "night",
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
      }
      vim.cmd "colorscheme tokyonight"
    end,
  },
  --  {
  --    "scottmckendry/cyberdream.nvim",
  --    lazy = false,
  --    priority = 1000,
  --    config = function()
  --        require("cyberdream").setup({
  --            -- Recommended - see "Configuring" below for more config options
  --            transparent = true,
  --            italic_comments = true,
  --            hide_fillchars = true,
  --            borderless_telescope = false,
  --            terminal_colors = true,
  --        })
  --        vim.cmd("colorscheme cyberdream") -- set the colorscheme
  --    end,
  --  },
}
