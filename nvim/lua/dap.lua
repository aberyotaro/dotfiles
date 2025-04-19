local dap = require("dap")
require("dap-go").setup()

-- キーマッピング例
dap.adapters.go = {
  type = "server", host = "127.0.0.1", port = 38697,
}
dap.configurations.go = {
  {
    type = "go", name = "Debug", request = "launch",
    program = "${file}",
  },
}