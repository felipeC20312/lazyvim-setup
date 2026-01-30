return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      dartls = {
        filetypes = { "dart" },
        handlers = {
          ["$/progress"] = function() end,
        },
        flags = {
          debounce_text_changes = 500,
        },
        init_options = {
          onlyAnalyzeProjectsWithOpenFiles = true,
          suggestFromUnimportedLibraries = true,
          closingLabels = true,
          outline = true,
          flutterOutline = true,
        },
        settings = {
          dart = {
            completeFunctionCalls = true,
            showTodos = true,
            analysisExcludedFolders = {
              vim.fn.expand("$HOME/.pub-cache"),
              vim.fn.expand("$HOME/.asdf/installs/flutter"),
            },
          },
        },
      },
    },
  },
}
