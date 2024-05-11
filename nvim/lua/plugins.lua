return {
  "nvim-lua/plenary.nvim",
  -- mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
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
}
