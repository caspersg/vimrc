return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  config = function()
    require('toggleterm').setup { size = 40 }
    vim.keymap.set('n', '<leader>tt', vim.cmd.ToggleTerm, { desc = '[t]erminal [t]erm' })
    -- vim.keymap.set("n", "<leader>tt", vim.cmd.ToggleTerm, { desc = "[t]erminals [t]oggle" })
  end,
}
