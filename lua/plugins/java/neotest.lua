return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rcasia/neotest-java",
    "weilbith/neotest-gradle",
  },
  keys = {
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest Test",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run File Tests",
    },
    {
      "<leader>ta",
      function()
        require("neotest").run.run(vim.fn.getcwd())
      end,
      desc = "Run All Tests",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Test Summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true })
      end,
      desc = "Show Test Output",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle Output Panel",
    },
    {
      "<leader>td",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug Nearest Test",
    },
    {
      "<leader>tS",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop Test",
    },
    {
      "<leader>tw",
      function()
        require("neotest").watch.toggle()
      end,
      desc = "Toggle Watch",
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-java")({
          ignore_wrapper = false, -- usar mvnw/gradlew se disponível
        }),
        require("neotest-gradle"),
      },
      discovery = {
        enabled = true,
      },
      running = {
        concurrent = true,
      },
      summary = {
        open = "botright vsplit | vertical resize 50",
      },
      icons = {
        passed = "✓",
        running = "⟳",
        failed = "✗",
        skipped = "⊘",
        unknown = "?",
      },
      output = {
        open_on_run = false,
      },
      quickfix = {
        open = false,
      },
    })
  end,
}
