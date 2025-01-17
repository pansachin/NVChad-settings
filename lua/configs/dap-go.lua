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
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<leader>b", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Condition: ")
end, { desc = "Set Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dr", function()
  require("dap").repl.open()
end, { desc = "Open DAP REPL" })
vim.keymap.set("n", "<leader>dl", function()
  require("dap").run_last()
end, { desc = "Run Last Debugging Session" })
vim.keymap.set("n", "<leader>dt", function()
  require("dap-go").debug_test()
end, { desc = "Debug Go Test" })
