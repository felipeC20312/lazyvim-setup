return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.mapping["<C-Space>"] = cmp.mapping.complete()
  end,
}
