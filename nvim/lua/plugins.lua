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
    "neovim/nvim-lspconfig",
  
    -- Go 開発
    "ray-x/go.nvim",
    "leoluz/nvim-dap-go",
  
    -- テスト・デバッグ
    "mfussenegger/nvim-dap",
    { "nvim-neotest/neotest", dependencies = { "nvim-lua/plenary.nvim" } },
    "nvim-neotest/neotest-go",
  
    -- Nuxt3/Vue3 開発
    "jose-elias-alvarez/typescript.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "windwp/nvim-ts-autotag",

    -- IDEライクなファイルエクスプローラー
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

        -- キーマップの設定
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
      end,
    },
}