local duckyiced = require("colorscheme.duckyiced")
-- local duckysummer = require("colorscheme.duckysummer")

return {
  -- Catppuccin
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
    opts = function(_, opts)
      local duckyiced = require("colorscheme.duckyiced")

      -- força flavor
      opts.flavor = "mocha"

      -- garante override correto (sem perder merge anterior)
      opts.color_overrides = opts.color_overrides or {}
      opts.color_overrides.mocha = duckyiced

      -- 👇 aqui está o ponto do seu problema
      opts.compile = {
        enabled = false,
      }

      -- mantém sua config existente sem perder nada
      opts.float = vim.tbl_deep_extend("force", opts.float or {}, {
        solid = false,
      })

      opts.integrations = vim.tbl_deep_extend("force", opts.integrations or {}, {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = {
          enabled = true,
          scope_color = "surface1",
          colored_indent_levels = false,
        },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      })

      return opts
    end,
  },

  -- Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    name = "tokyonight",
    opts = {
      style = "night",
      transparent = true,
    },
  },

  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    name = "gruvbox",
    opts = {
      contrast = "hard",
      transparent_mode = true,
    },
  },

  -- Theme Setup
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin",
  --   },
  -- },
}
