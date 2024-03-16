local function change_nvim_tree_dir()
  local nvim_tree = require("nvim-tree")
  nvim_tree.change_dir(vim.fn.getcwd())
end

return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      -- auto_save_enabled = true,
      -- auto_session_enable_last_session = true,
      -- auto_session_last_session_dir = "~/.local/share/nvim/sessions",
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      post_restore_cmds = { change_nvim_tree_dir }, --[[ , "NvimTreeOpen" }, ]]
      pre_save_cmds = { "NvimTreeClose" },
    })
    vim.keymap.set("n", "<leader>sS", vim.cmd.SearchSession, { desc = "[s]earch [S]ession" })
  end,
}
