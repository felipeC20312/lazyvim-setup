return {
  "nvim-mini/mini.icons",
  lazy = false,
  opts = {
    extension = {
      md = { glyph = "", hl = "MiniIconsMd" },
      lua = { glyph = "󰢱", hl = "MiniIconsLua" },
      json = { glyph = "󰘦", hl = "MiniIconsJson" },
      git = { glyph = "󰊢", hl = "MiniIconsGit" },
      kt = { glyph = "", hl = "MiniIconsKotlin" },
      kts = { glyph = "", hl = "MiniIconsKotlin" },
    },
    file = {
      [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
      [".gitignore"] = { glyph = "󰊢", hl = "MiniIconsGit" },
      [".gitattributes"] = { glyph = "󰊢", hl = "MiniIconsGit" },
      ["package.json"] = { glyph = "󰎙", hl = "MiniIconsJson" },
      ["tsconfig.json"] = { glyph = "󰘦", hl = "MiniIconsJson" },
      ["gradlew"] = { glyph = "", hl = "MiniIconsGradle" },
      ["gradlew.bat"] = { glyph = "", hl = "MiniIconsGradleBat" },
    },
    filetype = {
      gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
    },
    directory = {
      app = { glyph = "󰉋", hl = "MiniIconsApp" },
      application = { glyph = "󰉋", hl = "MiniIconsApp" },
      domain = { glyph = "󱋣", hl = "MiniIconsDomain" },
      config = { glyph = "󱁿", hl = "MiniIconsConfig" },
      persistency = { glyph = "󰉋", hl = "MiniIconsPersistency" },

      src = { glyph = "󰉋", hl = "MiniIconsSrc" },
      test = { glyph = "󰙨", hl = "MiniIconsTest" },
    },
    default = {
      directory = { glyph = "󰉋", hl = "MiniIconsFolder" },
    },
  },
  init = function()
    -- Arquivos
    vim.api.nvim_set_hl(0, "MiniIconsMd", { fg = "#94e2d5", bold = true }) -- teal
    vim.api.nvim_set_hl(0, "MiniIconsLua", { fg = "#89bafa", bold = true }) -- blue
    vim.api.nvim_set_hl(0, "MiniIconsJson", { fg = "#f9e2af", bold = true }) -- yellow
    vim.api.nvim_set_hl(0, "MiniIconsGit", { fg = "#f38b8b", bold = true }) -- red
    vim.api.nvim_set_hl(0, "MiniIconsKotlin", { fg = "#94e2d5", bold = true })
    vim.api.nvim_set_hl(0, "MiniIconsGradle", { fg = "#94e2d5", bold = true })
    vim.api.nvim_set_hl(0, "MiniIconsGradleBat", { fg = "#f9e2af", bold = true })

    -- Diretórios principais
    vim.api.nvim_set_hl(0, "MiniIconsApp", { fg = "#f9e2af", bold = true })
    vim.api.nvim_set_hl(0, "MiniIconsDomain", { fg = "#f38e7d", bold = true }) -- magenta
    vim.api.nvim_set_hl(0, "MiniIconsConfig", { fg = "#f38b8b", bold = true })
    vim.api.nvim_set_hl(0, "MiniIconsPersistency", { fg = "#94e2d5", bold = true })

    -- Outros diretórios
    vim.api.nvim_set_hl(0, "MiniIconsSrc", { fg = "#fab387", bold = true })
    vim.api.nvim_set_hl(0, "MiniIconsTest", { fg = "#f9e2af", bold = true })

    -- Defaults
    vim.api.nvim_set_hl(0, "MiniIconsFolder", { fg = "#6c7086", bold = true })
  end,
  config = function(_, opts)
    require("mini.icons").setup(opts)
  end,
}
