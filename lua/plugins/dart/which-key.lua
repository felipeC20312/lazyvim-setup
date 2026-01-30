return {
  "folke/which-key.nvim",
  optional = true,
  ft = "dart",
  opts = {
    spec = {
      { "<leader>F", group = "Flutter", icon = " " },
      { "<leader>Fr", "<cmd>FlutterRun<cr>", desc = "Run", icon = " " },
      { "<leader>Fq", "<cmd>FlutterQuit<cr>", desc = "Quit", icon = "󰗼 " },
      { "<leader>FR", "<cmd>FlutterRestart<cr>", desc = "Restart", icon = "󰜉 " },
      { "<leader>Fh", "<cmd>FlutterReload<cr>", desc = "Hot Reload", icon = "󰑓 " },
      { "<leader>FD", "<cmd>FlutterDetach<cr>", desc = "Detach", icon = "󰌑 " },

      { "<leader>Fd", "<cmd>FlutterDevices<cr>", desc = "Devices", icon = "󰄳 " },
      { "<leader>Fe", "<cmd>FlutterEmulators<cr>", desc = "Emulators", icon = "󱡓 " },

      { "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Outline", icon = "󰙅" },
      { "<leader>Fl", "<cmd>FlutterLspRestart<cr>", desc = "LSP Restart", icon = "󰌘 " },
      { "<leader>Fp", "<cmd>FlutterCopyProfilerUrl<cr>", desc = "Copy Profiler URL", icon = "󱉶 " },
    },
  },
}
