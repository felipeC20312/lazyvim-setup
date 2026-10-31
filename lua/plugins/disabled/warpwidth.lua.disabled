return {
  "rickhowe/wrapwidth",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "text" },
      callback = function()
        vim.cmd("Wrapwidth 120")
      end,
    })
  end,
}
