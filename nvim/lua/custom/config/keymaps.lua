-- custom keymaps (
-- Most keymaps will be defined in the plugin

-- TODO why does <C-.> call NvimTreeToggle ?
--vim.keymap.set("n", "<C-.>", "<C-o>", {})
--vim.keymap.set("n", "<C-,>", "<C-i>", {})

vim.keymap.set('n', '<leader>md', ':delm! | delm A-Z<CR>', { desc = '[m]arks [d]elete all' })
vim.keymap.set('x', '<leader>p', '"_dP', { desc = '[p]aste keep register', noremap = true })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = '[b]uffer [d]elete' })
vim.keymap.set('n', '<leader>bn', ':enew<CR>', { desc = '[b]uffer [n]ew' })

vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'move visual block up' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'move visual block down' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'keep cursor position when joining lines' })

-- keep the cursor in the middle (
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
-- )
-- don't enter special mode
vim.api.nvim_set_keymap('n', 'Q', '<Nop>', { noremap = true })

-- custom keymaps )

-- notes (
--  lsp:
--    goto: leader g
--    code action: leader ca
--    type def: leader D
--    workspace symbols: leader ws
--    rename: leader rn
--    docs: K
--    refactor: :Refactor
--
--  find:
--    file: :find *substring
--    file: leader s f substring
--    buffer: :b substring
--    buffer: leader space substring
--
--  search:
--    fuzzy in buffer: leader /
--    grep in buffer: leader s /
--    grep in files: leader sg
--    search word: leader sw
--
--  search replace:
--    spectre toggle: leader sr
--    visual search: leader sv
--    search word current file: leader sc
--    line: :s/old/new/gc
--    file: :%s/old/new/gc
--
--  comment toggle line: gcc
--
--  file browser:
--    open NvimTree: C-n
--    mini.files: leader mf
--    telescope files: leader sF
--
--  buffer:
--    new leader bn
--    delete leader bd
--
--  split arguments toggle: gS
--
--  merge conflicts:
--    open: leader do
--    close: leader dc
--
--  marks:
--    local: m a
--    global: m A
--    goto: '
--    delete all: leader md
--
--  git:
--    git status: :G
--
--  undo:
--    show undo history: leader u
--
--  column vertical visual: C-q
--
-- notes )
