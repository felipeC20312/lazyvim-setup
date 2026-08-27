return {
  {
    "lopi-py/luau-lsp.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("luau-lsp").setup({
        platform = {
          type = "roblox",
        },
        fflags = {
          sync = false,
        },
        sourcemap = {
          enabled = true,
        },
      })
    end,
  },
}
