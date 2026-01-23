return {
  "nvim-mini/mini.icons",
  lazy = false,
  opts = {
    extension = {
      md = { glyph = "", hl = "dkyCian" },
      lua = { glyph = "󰢱", hl = "dkyBlue" },
      git = { glyph = "󰊢", hl = "dkyOrangeDark" },
      json = { glyph = "󰘦", hl = "dkyYellow" },
      kt = { glyph = "", hl = "dkyPurpleDeep" },
      kts = { glyph = "", hl = "dkyPurple" },
    },
    file = {
      [".gitignore"] = { glyph = "󰊢", hl = "dkyOrange" },
      ["gradlew"] = { glyph = "", hl = "dkyCian" },
      [".go-version"] = { glyph = "", hl = "dkyBlue" },
      ["package.json"] = { glyph = "󰎙", hl = "dkyGreen" },
      [".gitattributes"] = { glyph = "󰊢", hl = "dkyOrange" },
      ["tsconfig.json"] = { glyph = "󰘦", hl = "dkyYellow" },
      ["gradlew.bat"] = { glyph = "", hl = "dkyBlue" },
    },
    filetype = {
      gotmpl = { glyph = "󰟓", hl = "dkyCian" },
    },
    directory = {
      app = { glyph = "󰉋", hl = "dkyRed" },
      src = { glyph = "󰉋", hl = "dkyOrangeDark" },
      test = { glyph = "󰙨", hl = "dkyYellow" },
      domain = { glyph = "󱋣", hl = "dkyOrange" },
      config = { glyph = "󱁿", hl = "dkyCian" },
      application = { glyph = "󰉋", hl = "dkyRed" },
      persistency = { glyph = "󰉋", hl = "dkyPurple" },
    },
    default = {
      directory = { glyph = "󰉋", hl = "dkyGray" },
    },
  },
  init = function()
    vim.api.nvim_set_hl(0, "dkyRed", { fg = "#f38b8b", bold = true })
    vim.api.nvim_set_hl(0, "dkyGray", { fg = "#6c7086", bold = true })
    vim.api.nvim_set_hl(0, "dkyCian", { fg = "#94e2d5", bold = true })
    vim.api.nvim_set_hl(0, "dkyGreen", { fg = "#BFDA89", bold = true })
    vim.api.nvim_set_hl(0, "dkyBlue", { fg = "#89bafa", bold = true })
    vim.api.nvim_set_hl(0, "dkyYellow", { fg = "#f9e2af", bold = true })
    vim.api.nvim_set_hl(0, "dkyOrange", { fg = "#fab387", bold = true })
    vim.api.nvim_set_hl(0, "dkyPurple", { fg = "#B7A7FF", bold = true })
    vim.api.nvim_set_hl(0, "dkyPurpleDeep", { fg = "#8C7CFF", bold = true })
    vim.api.nvim_set_hl(0, "dkyOrangeDark", { fg = "#f38e7d", bold = true })
  end,
  config = function(_, opts)
    require("mini.icons").setup(opts)
  end,
}
