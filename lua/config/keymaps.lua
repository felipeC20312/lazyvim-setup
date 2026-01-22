vim.keymap.set("n", "<leader>ctw", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle wrap" })
