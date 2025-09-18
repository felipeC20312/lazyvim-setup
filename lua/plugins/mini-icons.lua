return {
  "nvim-mini/mini.icons",
  enabled = true,
  version = "*",
  opts = {
    style = "glyph",
    file = {
      -- Match exact filenames
      -- ["init.lua"] = { glyph = "" },
      -- ["Dockerfile"] = { glyph = "" },
      -- [".gitignore"] = { glyph = "" },
    },
    directory = {
      -- Match directory names
      -- src = { glyph = "" },
      -- tests = { glyph = "" },
      -- ["__pycache__"] = { glyph = "" },
    },
    extension = {
      -- Match file extensions only (e.g., .ts, .md)
      -- ts = { glyph = "" },
      -- lua = { glyph = "" },
      md = {
        glyph = " ",
        highlight = "readmeFile",
      },
      -- json = { glyph = "" },
      -- png = { glyph = "" },
    },
    -- Optional: define fallbacks
    default = {
      -- file = { glyph = "" },
      -- directory = { glyph = "" },
    },
  },
  init = function()
    vim.api.nvim_set_hl(0, "readmeFile", { fg = "#ff8800", bold = true })
  end,
}
