return {
  dir = "~/Desktop/projs/altr-projs/lua-projs/nvim-ai",
  name = "nvim-ai",
  config = function()
    require("nvim_ai").setup({
      prefix = "[Test AI]",
    })
  end,
}
