{
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {
        view = { width = 30, side = "left" },
        filters = { dotfiles = false },
      }
    end,
  },
  
  -- ファイルエクスプローラー切替
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)