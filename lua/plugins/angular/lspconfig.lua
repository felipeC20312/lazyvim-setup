return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      angularls = {},
    },
    setup = {
      angularls = function()
        Snacks.util.lsp.on({ name = "angularls" }, function(_, client)
          --HACK: disable angular renaming capability due to duplicate rename popping up
          client.server_capabilities.renameProvider = false
        end)
      end,
    },
  },
}
