-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false

-- Setup languages suport:
vim.opt.spell = true
vim.opt.spelllang = { "pt_br", "en" }
vim.opt_local.textwidth = 120
vim.opt_local.colorcolumn = "120"
