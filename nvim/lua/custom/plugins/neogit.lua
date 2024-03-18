return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
    'ibhagwan/fzf-lua', -- optional
  },
  config = function()
    require('neogit').setup {
      integrations = {
        telescope = true,
        diffview = true,
        fzf_lua = true,
      },
    }

    vim.keymap.set('n', '<leader>G', ':Neogit<CR>', { desc = 'neo[G]it' })
  end,
}
