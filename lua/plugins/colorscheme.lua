return {
  -- Catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavor = "mocha",
      transparent_background = true,

      color_overrides = {
        mocha = {
          -- Fundo
          base = "#1e1e2e",
          mantle = "#181825",
          crust = "#11111b",

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
          rosewater = "#fab387", -- tom mais claro de laranja
          flamingo = "#f9b26b", -- laranja queimado
          pink = "#f38e7d", -- coral suave
          peach = "#fab387", -- laranja padrão
          maroon = "#e78a4e", -- laranja profundo
          mauve = "#dd835e", -- intermediário entre rosa e laranja
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
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
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
