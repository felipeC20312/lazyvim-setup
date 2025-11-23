return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
      {
        name = "@angular/language-server",
        location = LazyVim.get_pkg_path("angular-language-server", "/node_modules/@angular/language-server"),
        enableForWorkspaceTypeScriptVersions = false,
      },
    })
  end,
}
