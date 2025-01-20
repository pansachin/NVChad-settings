require("dap-go").setup {
  dap_configurations = {
    {
      type = "go",
      name = "Debug package with args",
      request = "launch",
      mode = "debug",
      program = "${fileDirname}",
      args = require("dap-go").get_arguments,
      outputMode = "remote",
      -- buildFlags = require("dap-go").get_build_flags,
    },
  },
}

-- Key mappings for debugging with DAP
vim.keymap.set("n", "<leader>dt", function()
  require("dap-go").debug_test()
end, { desc = "Debug Go Test" })
