local map = vim.keymap.set

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle DAP Breakpoint" })

map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue DAP" })
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
