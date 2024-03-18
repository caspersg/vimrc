-- custom keymaps (
-- Most keymaps will be defined in the plugin

-- TODO why does <C-.> call NvimTreeToggle ?
--vim.keymap.set("n", "<C-.>", "<C-o>", {})
--vim.keymap.set("n", "<C-,>", "<C-i>", {})
vim.keymap.set('n', '<leader>md', ':delm! | delm A-Z<CR>', { desc = '[m]arks [d]elete all' })
vim.keymap.set('x', '<leader>p', '"_dP', { desc = '[p]aste keep register', noremap = true })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = '[b]uffer [d]elete' })
vim.keymap.set('n', '<leader>bn', ':enew<CR>', { desc = '[b]uffer [n]ew' })

-- custom keymaps )

-- notes (
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
