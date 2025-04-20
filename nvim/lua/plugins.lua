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
    {
      'github/copilot.vim',
       config = function()
       -- GitHub Copilot の設定（必要に応じて設定）
       vim.g.copilot_no_tab_map = true  -- Tab キーの競合を防ぐ
       vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept()', { expr = true }) -- Copilot で提案を受け入れる
      end,
    },
}
