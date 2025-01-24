require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- exit terminal mode
map("t", "<leader><ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
