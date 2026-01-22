return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
    { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
    { "<leader>di", "<cmd>DapStepInto<cr>", desc = "Step Into" },
    { "<leader>do", "<cmd>DapStepOver<cr>", desc = "Step Over" },
    { "<leader>dO", "<cmd>DapStepOut<cr>", desc = "Step Out" },
    { "<leader>dt", "<cmd>DapTerminate<cr>", desc = "Terminate" },
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle DAP UI",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      desc = "Eval",
      mode = { "n", "v" },
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Configurar UI do DAP
    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 10,
          position = "bottom",
        },
      },
    })

    -- Abrir/fechar UI automaticamente
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Configurar virtual text
    require("nvim-dap-virtual-text").setup({
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
    })

    -- Ícones para breakpoints
    vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "󱂅 ", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = " ", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "", linehl = "", numhl = "" })
  end,
}
