return {
  "nvim-mini/mini.icons",
  lazy = false,
  priority = 900,
  opts = {
    extension = {
      md = { glyph = "", hl = "dkyCian" },
      lua = { glyph = "󰢱", hl = "dkyBlue" },
      luau = { glyph = "󰢱", hl = "dkyBlueDeep" },
      git = { glyph = "󰊢", hl = "dkyOrangeDeep" },
      json = { glyph = "󰘦", hl = "dkyYellow" },
      kt = { glyph = "", hl = "dkyPurpleDeep" },
      kts = { glyph = "", hl = "dkyPurple" },
      go = { glyph = "", hl = "dkyBlue" },
      rs = { glyph = "", hl = "dkyOrange" },
      exe = { glyph = "", hl = "dkyGreen" },
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
      sh = { glyph = "", hl = "dkyGreen" },
      bash = { glyph = "", hl = "dkyGreen" },
      zsh = { glyph = "", hl = "dkyGreen" },
    },
    directory = {
      app = { glyph = "󰉋", hl = "dkyRed" },
      game = { glyph = "󱧺", hl = "dkyOrange" },
      src = { glyph = "󰉋", hl = "dkyOrangeDeep" },
      core = { glyph = "󱁿", hl = "dkyYellowDeep" },
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
  config = function(_, opts)
    require("mini.icons").setup(opts)

    local function set_highlihts()
      vim.api.nvim_set_hl(0, "dkyRed", { fg = "#f38b8b", bold = true })
      vim.api.nvim_set_hl(0, "dkyGray", { fg = "#6c7086", bold = true })
      vim.api.nvim_set_hl(0, "dkyCian", { fg = "#94e2d5", bold = true })
      vim.api.nvim_set_hl(0, "dkyGreen", { fg = "#BFDA89", bold = true })
      vim.api.nvim_set_hl(0, "dkyBlue", { fg = "#89bafa", bold = true })
      vim.api.nvim_set_hl(0, "dkyYellow", { fg = "#f9e2af", bold = true })
      vim.api.nvim_set_hl(0, "dkyOrange", { fg = "#fab387", bold = true })
      vim.api.nvim_set_hl(0, "dkyPurple", { fg = "#B7A7FF", bold = true })
      vim.api.nvim_set_hl(0, "dkyBlueDeep", { fg = "#3f89f7", bold = true })
      vim.api.nvim_set_hl(0, "dkyYellowDeep", { fg = "#ffdaaa", bold = true })
      vim.api.nvim_set_hl(0, "dkyPurpleDeep", { fg = "#8C7CFF", bold = true })
      vim.api.nvim_set_hl(0, "dkyOrangeDeep", { fg = "#f38e7d", bold = true })
    end

    set_highlihts()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_highlihts,
    })
  end,
}
