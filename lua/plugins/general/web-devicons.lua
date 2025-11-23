return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    require("nvim-web-devicons").setup({
      override = {
        md = {
          icon = " ",
          color = "#7DAEA3",
          cterm_color = "214",
          name = "Markdown",
        },
        lua = {
          icon = " ",
          color = "#B3E5FC",
          cterm_color = "74",
          name = "Lua",
        },
        json = {
          icon = " ",
          color = "#D8A657",
          cterm_color = "185",
          name = "Json",
        },
        git = {
          icon = " ",
          color = "#DB4B33",
          name = "Git",
        },
      },
      default = true,
    })
  end,
}
