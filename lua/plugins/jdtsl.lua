return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local jdtls = require("jdtls")

      local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace/"

      local config = {
        cmd = {
          "jdtls",
          "-data",
          workspace_dir,
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            completion = { favoriteStaticMembers = { "org.junit.Assert.*" } },
          },
        },
        init_options = {
          bundles = {},
        },
      }

      -- Inicia ou anexa o JDTLS
      jdtls.start_or_attach(config)
    end,
  },
}
