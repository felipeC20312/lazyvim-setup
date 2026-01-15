return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      angularls = {},
      kotlin_lsp = {},
    },
    setup = {
      angularls = function()
        Snacks.util.lsp.on({ name = "angularls" }, function(_, client)
          client.server_capabilities.renameProvider = false
        end)
      end,
    },
  },
}
