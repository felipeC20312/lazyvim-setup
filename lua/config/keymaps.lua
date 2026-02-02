vim.keymap.set("n", "<leader>ctw", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle wrap" })

-- SortJSON jq
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function(ev)
    vim.keymap.set("n", "<leader>cj", function()
      if vim.fn.executable("jq") == 1 then
        vim.cmd("silent %!jq --sort-keys .")
      elseif vim.fn.executable("python3") == 1 then
        vim.cmd("silent %!python3 -m json.tool --sort-keys")
      else
        vim.notify("Install jq or python3 for JSON sorting", vim.log.levels.WARN)
      end
    end, {
      buffer = ev.buf,
      desc = "󰘦 Sort JSON",
    })
  end,
})

-- Flutter keymaps
-- local flutter_maps = {
--   { "<leader>fr", "<cmd>FlutterRun<cr>", desc = "Flutter Run" },
--   { "<leader>fq", "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },
--   { "<leader>fr", "<cmd>FlutterReload<cr>", desc = "Flutter Reload" },
--   { "<leader>fR", "<cmd>FlutterRestart<cr>", desc = "Flutter Restart" },
--   { "<leader>fd", "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
--   { "<leader>fe", "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators" },
--   { "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Flutter Outline" },
--   { "<leader>fD", "<cmd>FlutterDetach<cr>", desc = "Flutter Detach" },
--   { "<leader>fl", "<cmd>FlutterLspRestart<cr>", desc = "Flutter LSP Restart" },
-- }

-- for _, map in ipairs(flutter_maps) do
--   vim.keymap.set("n", map[1], map[2], { desc = map.desc })
-- end
