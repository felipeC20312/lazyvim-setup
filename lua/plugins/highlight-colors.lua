return {
  "brenoprata10/nvim-highlight-colors",
  branch = "main",
  config = function()
    require("nvim-highlight-colors").setup({
      render = "background",
      virtual_symbol = "■",
      virtual_symbol_prefix = "",
      virtual_symbol_suffix = " ",
      virtual_symbol_position = "inline",

      enable_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_ansi = true,
      enable_tailwind = true,
      enable_short_hex = true,
      enable_var_usage = true,
      enable_named_colors = true,
      enable_hsl_without_function = true,

      exclude_buftypes = {},
      exclude_filetypes = {},
      exclude_buffer = function(bufnr) end,
    })
  end,
}
