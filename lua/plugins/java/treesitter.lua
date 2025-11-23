return {
  "nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "java" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
