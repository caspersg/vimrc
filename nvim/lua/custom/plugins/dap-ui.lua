return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  config = function()
    require('dapui').setup()

    vim.keymap.set('n', '<leader>dt', function()
      require('dapui').toggle()
    end, { desc = '[d]ebug [t]oggle' })
    vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>', { desc = '[d]ebug toggle [b]reakpoint' })
    vim.keymap.set('n', '<leader>dc', ':DapContinue<CR>', { desc = '[d]ebug [c]continue' })
    vim.keymap.set('n', '<leader>dr', ':lua require("dapui").open({reset = true})<CR>', { desc = '[d]ebug [r]eset UI' })
  end,
}
