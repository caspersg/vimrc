return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'suketa/nvim-dap-ruby',
  },
  config = function()
    require('dap-ruby').setup {}
    local dap = require 'dap'
    -- dap.configurations.ruby = {
    --   {
    --     type = 'ruby',
    --     request = 'launch',
    --     name = 'Rails',
    --     program = 'bundle',
    --     programArgs = { 'exec', 'rails', 's' },
    --     useBundler = true,
    --   },
    -- }
  end,
}
