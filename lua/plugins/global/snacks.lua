return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  priority = 1000,
  lazy = false,

  opts = function(_, opts)
    opts.bigfile = { enabled = true }
    opts.dashboard = { enabled = false }
    opts.explorer = { enabled = true }
    opts.indent = { enabled = true }
    opts.input = { enabled = true }

    -- faz merge em vez de substituir
    opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
      enabled = true,
    })

    opts.notifier = { enabled = true }
    opts.quickfile = { enabled = true }
    opts.scope = { enabled = true }
    opts.scroll = { enabled = true }
    opts.statuscolumn = { enabled = true }
    opts.words = { enabled = true }

    return opts
  end,
}
