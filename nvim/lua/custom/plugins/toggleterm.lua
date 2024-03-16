return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function()
    require("toggleterm").setup({
      -- open_mapping = [[<c-t>]],
    })
    vim.keymap.set("n", "<leader>tc", vim.cmd.ToggleTerm, { desc = "[t]erminal [c]reate" })
    vim.keymap.set("n", "<leader>tt", vim.cmd.ToggleTermToggleAll, { desc = "[t]erminals [t]oggle" })
  end,
}
