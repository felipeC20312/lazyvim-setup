return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          if not vim.tbl_contains(opts.ensure_installed, "php-debug-adapter") then
            table.insert(opts.ensure_installed, "php-debug-adapter")
          end
        end,
      },
    },
    opts = function()
      local dap = require("dap")

      dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
        },
      }
    end,
  },
}
