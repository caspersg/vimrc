return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  config = function()
    require('dapui').setup {
      layouts = {
        {
          elements = {
            {
              id = 'scopes',
              size = 0.20,
            },
            {
              id = 'breakpoints',
              size = 0.20,
            },
            {
              id = 'stacks',
              size = 0.20,
            },
            {
              id = 'watches',
              size = 0.20,
            },
            {
              id = 'console',
              size = 0.20,
            },
          },
          position = 'left',
          size = 30,
        },
        {
          elements = { {
            id = 'repl',
            size = 1.00,
          } },
          position = 'bottom',
          size = 30,
        },
      },
    }

    vim.keymap.set('n', '<leader>dt', function()
      require('dapui').toggle()
    end, { desc = '[d]ebug [t]oggle' })
    vim.keymap.set('n', '<leader>dr', ':lua require("dapui").open({reset = true})<CR>', { desc = '[d]ebug [r]eset UI' })
    vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>', { desc = '[d]ebug toggle [b]reakpoint' })

    vim.keymap.set('n', '<leader>dc', ':DapContinue<CR>', { desc = '[d]ebug [c]continue' })
    vim.keymap.set('n', '<F9>', ':DapContinue<CR>', { desc = '[d]ebug [c]continue' })
    vim.keymap.set('n', '<F10>', ':DapStepOver<CR>', { desc = '[d]ebug step over' })
    vim.keymap.set('n', '<F11>', ':DapStepInto<CR>', { desc = '[d]ebug step into' })
    vim.keymap.set('n', '<F12>', ':DapStepOut<CR>', { desc = '[d]ebug step out' })
  end,
}
