return {
  "akinsho/flutter-tools.nvim",
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("flutter-tools").setup({

      -- importante para quem usa asdf
      flutter_lookup_cmd = "asdf where flutter",

      ui = {
        border = "rounded",
        notification_style = "native",
      },

      decorations = {
        statusline = {
          app_version = true,
          device = true,
          project_config = true,
        },
      },

      debugger = {
        enabled = true,
        exception_breakpoints = {},
        evaluate_to_string_in_debug_views = true,
      },

      root_patterns = { ".git", "pubspec.yaml" },

      default_run_args = {
        flutter = "--no-version-check",
      },

      widget_guides = {
        enabled = true,
      },

      closing_tags = {
        highlight = "Comment",
        prefix = "// ",
        priority = 10,
        enabled = true,
      },

      dev_log = {
        enabled = true,
        open_cmd = "15split",
        focus_on_open = true,
        notify_errors = false,
      },

      dev_tools = {
        autostart = false,
        auto_open_browser = false,
      },

      outline = {
        open_cmd = "30vnew",
        auto_open = false,
      },

      lsp = {
        color = {
          enabled = false,
        },

        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
          updateImportsOnRename = true,
        },
      },
    })

    -- Keymaps úteis
    local map = vim.keymap.set

    map("n", "<leader>fr", "<cmd>FlutterRun<cr>")
    map("n", "<leader>fR", "<cmd>FlutterRestart<cr>")
    map("n", "<leader>fl", "<cmd>FlutterReload<cr>")
    map("n", "<leader>fq", "<cmd>FlutterQuit<cr>")
    map("n", "<leader>fd", "<cmd>FlutterDevices<cr>")
    map("n", "<leader>fo", "<cmd>FlutterOutlineToggle<cr>")
    map("n", "<leader>flg", "<cmd>FlutterLogToggle<cr>")
  end,
}
