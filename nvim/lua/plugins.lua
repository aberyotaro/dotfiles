return {
  "nvim-lua/plenary.nvim",
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },
  -- lsp
  {
    "williamboman/mason.nvim",
    opts = function()
      require "configs.mason"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.nvim-lspconfig"
    end,
  },
  -- dap
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      dap.set_log_level "TRACE"
    end,
  },
  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dap-go").setup {
        dap_configurations = {
          {
            type = "go",
            name = "main server on remote",
            request = "attach",
            mode = "remote",
            program = "/go/src/project-source/tmp/api",
            substitutePath = {
              {
                from = "${workspaceFolder}/backend",
                to = "/go/src/project-source",
              },
            },
          },
          {
            type = "go",
            name = "subscriber on remote",
            request = "attach",
            mode = "remote",
            program = "/go/src/project-source/tmp/api",
            substitutePath = {
              {
                from = "${workspaceFolder}/backend",
                to = "/go/src/project-source",
              },
            },
          },
        },
        delve = {
          type = "server",
          path = "dlv",
          initialize_timeout_sec = 20,
          port = "${port}",
          args = {},
          build_flags = "",
          detached = true,
          cwd = nil,
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
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

  -- session
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        auto_restore_enabled = true,
        auto_save_enabled = true,
        auto_session_enable_last_session = false,
        auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
        auto_session_enabled = true,
        auto_save_interval = 18000,
        auto_restore_last_session = true,
        auto_session_suppress_dirs = nil,
        auto_session_vim_shutdown = "default",
        auto_session_allowed_paths = nil,
        auto_session_extra_support = nil,
      }
    end,
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
  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- cmp sources plugins
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require "cmp"
      cmp.setup {
        -- todo: move to configs
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = "vsnip" }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = "buffer" },
        }),
      }
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      require("lspconfig")["gopls"].setup {
        capabilities = capabilities,
      }
    end,
  },
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
        style = "moon",
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
      }
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup {
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = false,
        terminal_colors = true,
      }
    end,
  },
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup {}
    end,
  },
}
