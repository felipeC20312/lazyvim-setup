return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "php", "phpdoc", "blade" })

      -- lua/config/autocmds.lua (ou dentro do plugins/php se preferir centralizar)
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
  },
  -- filetype detection + treesitter parser dedicado para .blade.php
  {
    "EmranMR/tree-sitter-blade",
  },
}
