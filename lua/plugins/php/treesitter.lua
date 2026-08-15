return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Garante que a tabela existe antes de inserir
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "php", "phpdoc", "blade" })
    end,
  },

  -- Detecção de tipo de arquivo para Blade
  {
    "EmranMR/tree-sitter-blade",
    config = function()
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
  },
}
