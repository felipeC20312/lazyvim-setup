return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical Terminal" },
  },
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })

    -- Funções auxiliares para executar comandos Java
    local Terminal = require("toggleterm.terminal").Terminal

    -- Terminal para Maven
    local maven_term = Terminal:new({
      cmd = "mvn",
      hidden = true,
      direction = "float",
    })

    function _MAVEN_TOGGLE()
      maven_term:toggle()
    end

    -- Terminal para Gradle
    local gradle_term = Terminal:new({
      cmd = "gradle",
      hidden = true,
      direction = "float",
    })

    function _GRADLE_TOGGLE()
      gradle_term:toggle()
    end

    -- Comando para executar Maven clean install
    vim.api.nvim_create_user_command("MavenCleanInstall", function()
      local term = Terminal:new({
        cmd = "mvn clean install",
        direction = "float",
        close_on_exit = false,
      })
      term:toggle()
    end, {})

    -- Comando para executar Maven test
    vim.api.nvim_create_user_command("MavenTest", function()
      local term = Terminal:new({
        cmd = "mvn test",
        direction = "float",
        close_on_exit = false,
      })
      term:toggle()
    end, {})

    -- Comando para executar a aplicação Spring Boot
    vim.api.nvim_create_user_command("SpringBootRun", function()
      local term = Terminal:new({
        cmd = "mvn spring-boot:run",
        direction = "float",
        close_on_exit = false,
      })
      term:toggle()
    end, {})

    -- Comando para executar Gradle build
    vim.api.nvim_create_user_command("GradleBuild", function()
      local term = Terminal:new({
        cmd = "gradle build",
        direction = "float",
        close_on_exit = false,
      })
      term:toggle()
    end, {})

    -- Comando para executar Gradle test
    vim.api.nvim_create_user_command("GradleTest", function()
      local term = Terminal:new({
        cmd = "gradle test",
        direction = "float",
        close_on_exit = false,
      })
      term:toggle()
    end, {})

    -- Comando para executar Gradle run
    vim.api.nvim_create_user_command("GradleRun", function()
      local term = Terminal:new({
        cmd = "gradle run",
        direction = "float",
        close_on_exit = false,
      })
      term:toggle()
    end, {})

    -- Comando para executar Gradle bootRun (Spring Boot)
    vim.api.nvim_create_user_command("GradleBootRun", function()
      local term = Terminal:new({
        cmd = "gradle bootRun",
        direction = "float",
        close_on_exit = false,
      })
      term:toggle()
    end, {})
  end,
}
