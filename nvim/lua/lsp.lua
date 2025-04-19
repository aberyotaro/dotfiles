local lspconfig = require("lspconfig")

-- Go
lspconfig.gopls.setup({
  on_attach = require("keymaps").on_lsp_attach,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

-- Vue / TypeScript (Nuxt3)
lspconfig.volar.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})
lspconfig.tsserver.setup({ on_attach = require("keymaps").on_lsp_attach })