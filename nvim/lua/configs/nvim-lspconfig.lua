local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "html", "cssls" }
local map = vim.keymap.set

local on_attach = function(bufnr)
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr })
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr })
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr })
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr })
  map("n", "ts", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = bufnr })
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })
  map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr })
  map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr })
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr })
  map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = bufnr })
  map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = bufnr })
  map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", { buffer = bufnr })
  map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { buffer = bufnr })
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr })
  map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { buffer = bufnr })
  map("n", "<leader>cc", "<cmd>lua vim.lsp.diagnostic.clear(0)<CR>", { buffer = bufnr })
  map("n", "<leader>cn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { buffer = bufnr })
  map("n", "<leader>cp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", { buffer = bufnr })
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach(),
  }
end

lspconfig.lua_ls.setup {
  on_attach = on_attach(),
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}
lspconfig.gopls.setup {
  on_attach = on_attach(),
  cmd = { "gopls" },
  fileTypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    completeUnimported = true,
    usePlaceholders = true,
    analyses = {
      unusedParams = true,
    },
  },
}
