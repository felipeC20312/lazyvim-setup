return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
  config = function()
    require("nvim-highlight-colors").setup({
      render = "foreground", -- opções: "background", "foreground", "virtual"
      enable_named_colors = true,
      enable_tailwind = true,
    })
  end,
}
