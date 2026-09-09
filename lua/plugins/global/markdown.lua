return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      preset = "lazy",
      render_modes = { "n", "c" },
      anti_conceal = {
        enabled = true,
      },

      heading = {
        sign = false,
        enabled = true,
        width = "block",
        position = "inline",
        icons = {
          "󰲠 ",
          "󰲢 ",
          "󰲤 ",
          "󰲦 ",
          "󰲨 ",
          "󰲪 ",
        },

        left_pad = 1,
        right_pad = 2,
        min_width = 40,
        border = false,

        foregrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },

        backgrounds = {
          "transparent",
          "transparent",
          "transparent",
          "transparent",
          "transparent",
          "transparent",
        },
      },

      -- ============================================================
      -- CODE BLOCKS
      -- ============================================================
      code = {
        enabled = true,
        render_modes = true,
        sign = true,
        width = "block",
        conceal_delimiters = true,
        language = true,
        language_icon = true,
        language_name = true,
        language_info = true,
        position = "left",
        left_pad = 2,
        left_margin = 1,
        min_width = 40,
        border = "thin",
        language_border = " ",
        language_left = "",
        language_right = "",
        above = "▄",
        below = "▀",
        inline = true,
        inline_pad = 1,
        highlight = "RenderMarkdownCode",
        highlight_info = "RenderMarkdownCodeInfo",
        highlight_border = "RenderMarkdownCodeBorder",
        highlight_fallback = "RenderMarkdownCodeFallback",
        highlight_inline = "RenderMarkdownCodeInline",
        style = "full",
      },

      -- ============================================================
      -- OUTROS ELEMENTOS
      -- ============================================================
      dash = {
        enabled = true,
        width = 80,
        icon = "─",
      },

      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },

      checkbox = {
        enabled = true,

        unchecked = {
          icon = "󰄱 ",
        },

        checked = {
          icon = "󰄵 ",
          scope_highlight = "@markup.strikethrough",
        },
      },

      quote = {
        enabled = true,
        icon = "▎",
      },

      pipe_table = {
        enabled = true,
        preset = "round",
        cell = "padded",
      },

      link = {
        enabled = true,
      },

      latex = {
        enabled = false,
      },
    },

    config = function(_, opts)
      require("render-markdown").setup(opts)

      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "RenderMarkdownCode", { bg = "#343434" })
      set_hl(0, "RenderMarkdownCodeInline", { bg = "#343434" })
      set_hl(0, "RenderMarkdownCodeBorder", { bg = "#343434" })
    end,
  },
}
