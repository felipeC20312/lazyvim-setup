return {
  "mfussenegger/nvim-jdtls",
  opts = function(_, opts)
    -- Diretório home do usuário
    local home = os.getenv("HOME")
    local asdf_java_base = home .. "/.asdf/installs/java"

    -- Definir o JAVA_HOME para o Java 21 explicitamente
    local java_21_home = asdf_java_base .. "/temurin-21.0.8+9.0.LTS"
    vim.env.JAVA_HOME = java_21_home

    -- Adicionar o Java 21 ao PATH para garantir que o jdtls encontre
    local java_21_bin = java_21_home .. "/bin"
    if not string.find(vim.env.PATH, java_21_bin, 1, true) then
      vim.env.PATH = java_21_bin .. ":" .. vim.env.PATH
    end

    -- Configuração dos runtimes disponíveis via asdf
    opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
      java = {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-1.8",
              path = asdf_java_base .. "/temurin-8.0.462+8",
              default = false,
            },
            {
              name = "JavaSE-11",
              path = asdf_java_base .. "/temurin-11.0.27+6",
              default = false,
            },
            {
              name = "JavaSE-17",
              path = asdf_java_base .. "/temurin-17.0.15+6",
              default = false,
            },
            {
              name = "JavaSE-21",
              path = asdf_java_base .. "/temurin-21.0.8+9.0.LTS",
              default = true, -- Versão padrão (marcada com *)
            },
            {
              name = "JavaSE-24",
              path = asdf_java_base .. "/temurin-24.0.1+9",
              default = false,
            },
          },
        },
        -- Configurações adicionais recomendadas
        eclipse = {
          downloadSources = true,
        },
        maven = {
          downloadSources = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        format = {
          enabled = true,
          settings = {
            url = vim.fn.stdpath("config") .. "/lang-servers/intellij-java-google-style.xml",
            profile = "GoogleStyle",
          },
        },
        signatureHelp = {
          enabled = true,
        },
        completion = {
          favoriteStaticMembers = {
            "org.junit.jupiter.api.Assertions.*",
            "org.junit.Assert.*",
            "org.mockito.Mockito.*",
          },
        },
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
      },
    })

    -- Configurar o comando do jdtls para usar o Java 21 explicitamente
    opts.cmd = opts.cmd or {}
    -- Garantir que usamos o java correto
    if vim.fn.executable(java_21_bin .. "/java") == 1 then
      vim.env.JAVA_HOME = java_21_home
    end

    return opts
  end,
}
