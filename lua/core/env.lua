-- JAVA_HOME
local java_home = vim.fn.trim(vim.fn.system("asdf where java"))
vim.env.JAVA_HOME = java_home
vim.env.PATH = java_home .. "/bin:" .. vim.env.PATH
