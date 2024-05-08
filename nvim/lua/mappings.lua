require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "toggle nvimtree" })
map("n", "<leader>1", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>2", ":Telescope live_grep<CR>", { desc = "telescope live_grep" })

map("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true })
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true })
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true })
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true })
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
map(
  "n",
  "<leader>bc",
  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { silent = true }
)
map(
  "n",
  "<leader>l",
  ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  { silent = true }
)
-- dap-ui key map
map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true })
map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true })
-- dap-go key map
map("n", "<leader>td", ":lua require'dap-go'.debug_test()<CR>", { silent = true })
