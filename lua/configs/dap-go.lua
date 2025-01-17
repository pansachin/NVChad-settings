require("dap-go").setup {
  dap_configurations = {
    {
      type = "go",
      name = "Debug workspace folder",
      request = "launch",
      mode = "debug",
      program = "${workspaceFolder}/cmd/cleanup",
      args = require("dap-go").get_arguments,
      -- buildFlags = require("dap-go").get_build_flags,
    },
  },
}

-- Key mappings for debugging with DAP
vim.keymap.set("n", "<leader>dt", function()
  require("dap-go").debug_test()
end, { desc = "Debug Go Test" })
