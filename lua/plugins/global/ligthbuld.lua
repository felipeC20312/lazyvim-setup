return {
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true },
        sign = {
          enabled = true,
          text = " ",
        },
        virtual_text = {
          enabled = false,
        },
      })
    end,
  },
}
