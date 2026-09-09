vim.keymap.set("n", "<leader>ctw", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle wrap" })

-- SortJSON jq
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function(ev)
    vim.keymap.set("n", "<leader>cj", function()
      if vim.fn.executable("jq") == 1 then
        vim.cmd("silent %!jq --sort-keys .")
      elseif vim.fn.executable("python3") == 1 then
        vim.cmd("silent %!python3 -m json.tool --sort-keys")
      else
        vim.notify("Install jq or python3 for JSON sorting", vim.log.levels.WARN)
      end
    end, {
      buffer = ev.buf,
      desc = "󰘦 Sort JSON",
    })
  end,
})
