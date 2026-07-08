return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      kotlin = { "ktlint" },
      dart = { "dart_format" },
      php = { "pint" },
      blade = { "blade-formatter" },
      css = { "prettierd", "prettier" },
      vue = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
      angular = { "prettierd", "prettier" },
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      htmlangular = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      typescriptreact = { "prettierd ", "prettier" },
    },
    formatters = {
      prettier = {
        command = vim.fn.stdpath("data") .. "/mason/bin/prettierd",
        args = { "--stdin-filepath", "$FILENAME" },
      },

      pint = {
        command = function()
          return vim.fn.filereadable("vendor/bin/pint") == 1 and "vendor/bin/pint" or "pint"
        end,
      },
    },
  },
}
