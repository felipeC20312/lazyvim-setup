return {
  -- Catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavor = "mocha",
      -- transparent_background = true,
      float = {
        -- transparent = true,
        solid = false,
      },
      color_overrides = {
        mocha = {
          -- Fundo
<<<<<<< Updated upstream
          base = "#2B2D32",
          mantle = "#26282D",
          crust = "#1F2125",
=======
          base = "#2A2D33",
          mantle = "#25282D",
          crust = "#1E2125",
>>>>>>> Stashed changes

          -- Texto
          text = "#cdd6f4",
          subtext1 = "#bac2de",
          subtext0 = "#a6adc8",

          -- Superfícies
          surface2 = "#585b70",
          surface1 = "#45475a",
          surface0 = "#313244",

          -- Overlay
          overlay2 = "#9399b2",
          overlay1 = "#7f849c",
          overlay0 = "#6c7086",

          -- Tons principais
          red = "#f38ba8",
          green = "#a6e3a1",
          yellow = "#f9e2af",
          blue = "#89b4fa",
          magenta = "#cba6f7",
          teal = "#94e2d5",
          sky = "#89dceb",

          -- Substituindo rosas por laranjas
          rosewater = "#fab387",
          flamingo = "#f9b26b",
          pink = "#f38e7d",
          peach = "#fab387",
          maroon = "#e78a4e",
          mauve = "#dd835e",
        },
      },
      integrations = {
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
        indent_blankline = { enabled = true },
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
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        init = function()
          local bufline = require("catppuccin.groups.integrations.bufferline")
          function bufline.get()
            return bufline.get_theme()
          end
        end,
      },
    },
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
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
