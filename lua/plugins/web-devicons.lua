return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      default = true, -- usa ícone padrão se não houver correspondência
    })
  end,
}
