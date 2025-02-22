vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Create an autocommand group (or get the group if it already exists)
local custom_indent_group = vim.api.nvim_create_augroup("CustomIndent", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = custom_indent_group,
  pattern = "go",
  command = "setlocal tabstop=4 shiftwidth=4 noexpandtab",
})

-- Create an autocommand group (comment)
local custom_comment = vim.api.nvim_create_augroup("CustomTerraformSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = custom_comment,
  pattern = { "terraform", "hcl" },
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})
