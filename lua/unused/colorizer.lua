return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {},
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      buftypes = {},

      user_commands = true,
      lazy_load = false,
      user_default_options = {
        names = true,
        names_opts = {
          lowercase = true,
          camelcase = true,
          uppercase = false,
          strip_digits = false,
        },
        names_custom = false,
        RGB = true,
        RGBA = true,
        RRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,

        tailwind = true,
        tailwind_opts = {
          update_names = "both",
        },

        sass = { enable = true, parsers = { "css" } },
        xterm = false,

        mode = "background",
        virtualtext = "■",
        virtualtext_inline = false,
        virtualtext_mode = "foreground",
        always_update = false,

        hooks = {
          disable_line_highlight = false,
        },
      },
    })
  end,
}
