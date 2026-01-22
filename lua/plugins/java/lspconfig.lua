return {
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
              vim.keymap.set("n", "<leader>jgr", run_gradle_app, vim.tbl_extend("force", opts, { desc = "Gradle Run" }))
              vim.keymap.set(
                "n",
                "<leader>jgs",
                run_gradle_boot,
                vim.tbl_extend("force", opts, { desc = "Gradle Boot Run" })
              )
              vim.keymap.set("n", "<leader>jgb", gradle_build, vim.tbl_extend("force", opts, { desc = "Gradle Build" }))
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
}
