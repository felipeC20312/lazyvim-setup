-- ~/.config/nvim/lua/plugins/java-runner.lua
return {
  -- ========================================
  -- 1. DEBUGGING COM NVIM-DAP
  -- ========================================
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
      { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
      { "<leader>di", "<cmd>DapStepInto<cr>", desc = "Step Into" },
      { "<leader>do", "<cmd>DapStepOver<cr>", desc = "Step Over" },
      { "<leader>dO", "<cmd>DapStepOut<cr>", desc = "Step Out" },
      { "<leader>dt", "<cmd>DapTerminate<cr>", desc = "Terminate" },
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle DAP UI",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Eval",
        mode = { "n", "v" },
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Configurar UI do DAP
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      -- Abrir/fechar UI automaticamente
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Configurar virtual text
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
      })

      -- Ícones para breakpoints
      vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "󱂅 ", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = " ", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "", linehl = "", numhl = "" })
    end,
  },

  -- ========================================
  -- 2. NEOTEST PARA TESTES
  -- ========================================
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcasia/neotest-java",
      "weilbith/neotest-gradle",
    },
    keys = {
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest Test",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run File Tests",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.run(vim.fn.getcwd())
        end,
        desc = "Run All Tests",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Test Summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "Show Test Output",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug Nearest Test",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop Test",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle()
        end,
        desc = "Toggle Watch",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-java")({
            ignore_wrapper = false, -- usar mvnw/gradlew se disponível
          }),
          require("neotest-gradle"),
        },
        discovery = {
          enabled = true,
        },
        running = {
          concurrent = true,
        },
        summary = {
          open = "botright vsplit | vertical resize 50",
        },
        icons = {
          passed = "✓",
          running = "⟳",
          failed = "✗",
          skipped = "⊘",
          unknown = "?",
        },
        output = {
          open_on_run = false,
        },
        quickfix = {
          open = false,
        },
      })
    end,
  },

  -- ========================================
  -- 3. TOGGLETERM PARA TERMINAL FLUTUANTE
  -- ========================================
  {
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
  },

  -- ========================================
  -- 4. ATALHOS PERSONALIZADOS PARA JAVA/KOTLIN
  -- ========================================
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        jdtls = function()
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "java", "kotlin" },
            callback = function()
              local bufnr = vim.api.nvim_get_current_buf()
              local filetype = vim.bo[bufnr].filetype

              -- Detectar se é projeto Maven ou Gradle
              local function is_gradle_project()
                return vim.fn.filereadable("build.gradle") == 1
                  or vim.fn.filereadable("build.gradle.kts") == 1
                  or vim.fn.filereadable("settings.gradle") == 1
                  or vim.fn.filereadable("settings.gradle.kts") == 1
              end

              local function is_maven_project()
                return vim.fn.filereadable("pom.xml") == 1
              end

              local use_gradle = is_gradle_project()
              local use_maven = is_maven_project()

              -- Funções auxiliares Maven
              local function run_java_app_maven()
                vim.cmd("write")
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new({
                  cmd = "mvn compile exec:java",
                  direction = "float",
                  close_on_exit = false,
                })
                term:toggle()
              end

              local function run_spring_boot_maven()
                vim.cmd("write")
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new({
                  cmd = "mvn spring-boot:run",
                  direction = "float",
                  close_on_exit = false,
                })
                term:toggle()
              end

              local function maven_clean_install()
                vim.cmd("write")
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new({
                  cmd = "mvn clean install",
                  direction = "float",
                  close_on_exit = false,
                })
                term:toggle()
              end

              local function package_jar_maven()
                vim.cmd("write")
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new({
                  cmd = "mvn clean package",
                  direction = "float",
                  close_on_exit = false,
                })
                term:toggle()
              end

              local function maven_test()
                vim.cmd("write")
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new({
                  cmd = "mvn test",
                  direction = "float",
                  close_on_exit = false,
                })
                term:toggle()
              end

              -- Funções auxiliares Gradle
              local function run_gradle_app()
                vim.cmd("write")
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new({
                  cmd = "gradle run",
                  direction = "float",
                  close_on_exit = false,
                })
                term:toggle()
              end

              local function run_gradle_boot()
                vim.cmd("write")
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new({
                  cmd = "gradle bootRun",
                  direction = "float",
                  close_on_exit = false,
                })
                term:toggle()
              end

              local function gradle_build()
                vim.cmd("write")
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new({
                  cmd = "gradle build",
                  direction = "float",
                  close_on_exit = false,
                })
                term:toggle()
              end

              local function gradle_clean_build()
                vim.cmd("write")
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new({
                  cmd = "gradle clean build",
                  direction = "float",
                  close_on_exit = false,
                })
                term:toggle()
              end

              local function gradle_test()
                vim.cmd("write")
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new({
                  cmd = "gradle test",
                  direction = "float",
                  close_on_exit = false,
                })
                term:toggle()
              end

              -- Funções universais que detectam Maven ou Gradle
              local function run_app()
                if use_gradle then
                  run_gradle_app()
                else
                  run_java_app_maven()
                end
              end

              local function run_spring_boot()
                if use_gradle then
                  run_gradle_boot()
                else
                  run_spring_boot_maven()
                end
              end

              local function clean_build()
                if use_gradle then
                  gradle_clean_build()
                else
                  maven_clean_install()
                end
              end

              local function package_app()
                if use_gradle then
                  gradle_build()
                else
                  package_jar_maven()
                end
              end

              local function run_tests()
                if use_gradle then
                  gradle_test()
                else
                  maven_test()
                end
              end

              -- Keymaps específicos do Java/Kotlin
              local opts = { buffer = bufnr, silent = true }

              -- Execução (universal Maven/Gradle)
              vim.keymap.set("n", "<leader>jr", run_app, vim.tbl_extend("force", opts, { desc = "Run App" }))
              vim.keymap.set(
                "n",
                "<leader>js",
                run_spring_boot,
                vim.tbl_extend("force", opts, { desc = "Run Spring Boot" })
              )
              vim.keymap.set("n", "<leader>jc", clean_build, vim.tbl_extend("force", opts, { desc = "Clean Build" }))
              vim.keymap.set("n", "<leader>jp", package_app, vim.tbl_extend("force", opts, { desc = "Package/Build" }))
              vim.keymap.set("n", "<leader>jt", run_tests, vim.tbl_extend("force", opts, { desc = "Run Tests" }))

              -- Debug (apenas para Java com jdtls)
              if filetype == "java" then
                local jdtls = require("jdtls")

                vim.keymap.set("n", "<leader>jd", function()
                  jdtls.test_class({ config = { stopOnEntry = false } })
                end, vim.tbl_extend("force", opts, { desc = "Debug Test Class" }))

                vim.keymap.set("n", "<leader>jD", function()
                  jdtls.test_nearest_method({ config = { stopOnEntry = false } })
                end, vim.tbl_extend("force", opts, { desc = "Debug Test Method" }))

                -- Refactoring (Java)
                vim.keymap.set(
                  "n",
                  "<leader>jo",
                  jdtls.organize_imports,
                  vim.tbl_extend("force", opts, { desc = "Organize Imports" })
                )
                vim.keymap.set(
                  "n",
                  "<leader>jv",
                  jdtls.extract_variable,
                  vim.tbl_extend("force", opts, { desc = "Extract Variable" })
                )
                vim.keymap.set("v", "<leader>jv", function()
                  jdtls.extract_variable(true)
                end, vim.tbl_extend("force", opts, { desc = "Extract Variable" }))
                vim.keymap.set(
                  "n",
                  "<leader>jC",
                  jdtls.extract_constant,
                  vim.tbl_extend("force", opts, { desc = "Extract Constant" })
                )
                vim.keymap.set("v", "<leader>jm", function()
                  jdtls.extract_method(true)
                end, vim.tbl_extend("force", opts, { desc = "Extract Method" }))

                -- Update project configuration
                vim.keymap.set(
                  "n",
                  "<leader>ju",
                  jdtls.update_project_config,
                  vim.tbl_extend("force", opts, { desc = "Update Project Config" })
                )
              end

              -- Atalhos específicos para Maven
              if use_maven then
                vim.keymap.set(
                  "n",
                  "<leader>jmr",
                  run_java_app_maven,
                  vim.tbl_extend("force", opts, { desc = "Maven Run" })
                )
                vim.keymap.set(
                  "n",
                  "<leader>jms",
                  run_spring_boot_maven,
                  vim.tbl_extend("force", opts, { desc = "Maven Spring Boot" })
                )
                vim.keymap.set(
                  "n",
                  "<leader>jmc",
                  maven_clean_install,
                  vim.tbl_extend("force", opts, { desc = "Maven Clean Install" })
                )
                vim.keymap.set(
                  "n",
                  "<leader>jmp",
                  package_jar_maven,
                  vim.tbl_extend("force", opts, { desc = "Maven Package" })
                )
                vim.keymap.set("n", "<leader>jmt", maven_test, vim.tbl_extend("force", opts, { desc = "Maven Test" }))
              end

              -- Atalhos específicos para Gradle
              if use_gradle then
                vim.keymap.set(
                  "n",
                  "<leader>jgr",
                  run_gradle_app,
                  vim.tbl_extend("force", opts, { desc = "Gradle Run" })
                )
                vim.keymap.set(
                  "n",
                  "<leader>jgs",
                  run_gradle_boot,
                  vim.tbl_extend("force", opts, { desc = "Gradle Boot Run" })
                )
                vim.keymap.set(
                  "n",
                  "<leader>jgb",
                  gradle_build,
                  vim.tbl_extend("force", opts, { desc = "Gradle Build" })
                )
                vim.keymap.set(
                  "n",
                  "<leader>jgc",
                  gradle_clean_build,
                  vim.tbl_extend("force", opts, { desc = "Gradle Clean Build" })
                )
                vim.keymap.set("n", "<leader>jgt", gradle_test, vim.tbl_extend("force", opts, { desc = "Gradle Test" }))
              end
            end,
          })

          return false
        end,
      },
    },
  },

  -- ========================================
  -- 5. WHICH-KEY PARA DOCUMENTAÇÃO
  -- ========================================
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>j", group = "java/kotlin", icon = " /  " },
        { "<leader>jm", group = "maven", icon = " " },
        { "<leader>jg", group = "gradle", icon = " " },
        { "<leader>d", group = "debug", icon = "󰠭 " },
        { "<leader>t", group = "test", icon = "󰙨 " },
      },
    },
  },

  -- ========================================
  -- 6. MASON PARA INSTALAR DEPENDÊNCIAS
  -- ========================================
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "jdtls",
        "java-debug-adapter",
        "java-test",
        "kotlin-language-server",
      })
    end,
  },

  -- ========================================
  -- 7. SUPORTE PARA KOTLIN
  -- ========================================
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "kotlin" })
      end
    end,
  },
}
