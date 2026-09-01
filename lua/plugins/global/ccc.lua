return {
  "uga-rosa/ccc.nvim",
  cmd = { "CccPick", "CccConvert", "CccHighlighterToggle" },
  keys = {
    { "<leader>cp", "<cmd>CccPick<cr>", desc = "Toggle Color Picker" },
  },
  config = function()
    require("ccc").setup({})
  end,
}
