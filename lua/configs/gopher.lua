-- add json tag
vim.keymap.set("n", "<leader>gsj", function()
  vim.cmd "GoTagAdd json"
end, { desc = "Add json struct tags" })

-- add yaml tag
vim.keymap.set("n", "<leader>gsy", function()
  vim.cmd "GoTagAdd yaml"
end, { desc = "Add yaml struct tags" })

-- add db tag
vim.keymap.set("n", "<leader>gsd", function()
  vim.cmd "GoTagAdd db"
end, { desc = "Add db struct tags" })
