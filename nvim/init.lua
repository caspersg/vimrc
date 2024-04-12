--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know how the Neovim basics, you can skip this step)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not sure exactly what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or neovim features used in kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your nvim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- no backup but large undo
vim.opt.swapfile = false
vim.opt.backup = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- show all whitespace
-- vim.opt.listchars = { eol = '$', space = '.', multispace = '.', tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
-- Mark the 100th column with a line
vim.opt.colorcolumn = "120"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 2

-- spelling spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = false

-- auto reload buffer
vim.o.autoread = true
-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [d]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [d]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
  -- add a plugin with just a link
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  -- Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup()
      local highlight = {
        "CursorColumn",
        "Whitespace",
      }
      require("ibl").setup({
        indent = { highlight = highlight, char = "" },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      })
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    "folke/tokyonight.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi("Comment gui=none")
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    priority = 1000,
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      -- require('tokyodark').setup(opts) -- calling setup is optional
      -- vim.cmd [[colorscheme tokyodark]]
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
  },
  {
    "savq/melange-nvim",
    priority = 1000,
  },
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
  },
  {
    "marko-cerovac/material.nvim",
    priority = 1000,
  },
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        integrations = {
          semantic_tokens = true,
        },
      })
    end,
  },
  { "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- put them in the right spots if you want.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for kickstart
  --
  --  Here are some example plugins that I've included in the kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = "custom.plugins" },
}, {
  defaults = {
    lazy = false,
  },
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
--
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- run all my other configs
require("custom/config/keymaps")

-- set theme
--
-- example code to show sematnic highlighting
-- function(ab)
--   ab.hi()
--   local ac = ""
--   ac.len()
-- end

-- semantic highlighting
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "Purple" })
--     vim.api.nvim_set_hl(0, "@lsp.mod.readonly", { italic = true })
--   end,
-- })
-- has semantic highlighting
-- vim.cmd.colorscheme("catppuccin")
vim.cmd.colorscheme("tokyodark")

-- playing around with LSP stuff
-- chatgpt generated
local function on_hover(err, result, ctx, config)
  if err then
    vim.notify("Error during hover request: " .. tostring(err), vim.log.levels.ERROR)
    return
  end
  if result then
    -- Process the result to extract and use the type information
    -- For example, you might want to print the type information in the command line
    local contents = result.contents
    -- The contents could be in MarkedString, MarkupContent, or an array of either
    if contents.kind then
      -- MarkupContent
      print(contents.value)
      vim.notify("got markupContent" .. contents.value)
    elseif contents.language then
      -- MarkedString
      print(contents.value)
      vim.notify("got markedString " .. contents.value)
    elseif type(contents) == "table" then
      -- Array of MarkedString or MarkupContent
      for _, item in ipairs(contents) do
        if item.language then
          print(item.value)
          vim.notify("got item.value " .. item.value)
        else
          print(item)
          vim.notify("got item " .. item)
        end
      end
    else
      -- Plain string
      print(contents)
      vim.notify("got plain string " .. contents)
    end
  end
end

-- Function to request hover information
local function request_hover()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/hover", params, on_hover)
end

-- Call the function to request hover information
-- request_hover()

vim.keymap.set("n", "<leader>x", request_hover, { desc = "testing" })

-- Basic idea:
-- get all symbols, then filter to just methods/functions, then filter by param type
-- to find all the methods that have the current type as a parameter
--
-- below approach:
-- call workspace/symbol
-- filter by kind
-- call workspace/symbol to get type
-- filter result by the type_to_match
--
-- problems:
-- Can't get all symbols, there's a limit
-- can't search by type
--
-- So instead, get all symbols from current document
-- jump to the first: works
-- show list of options in telescope: problems with async

function print_symbols()
  -- Step 1: Search for all function symbols in the workspace
  vim.lsp.buf_request(0, "workspace/symbol", { query = "" }, function(err, result, ctx, config)
    if err then
      vim.notify("Error during workspace/symbol request: " .. tostring(err), vim.log.levels.ERROR)
      return
    end
    if result then
      print("got a result")
      for k, v in pairs(result) do
        print(k .. " = " .. v)
      end
    end
  end)
end

function p_symbols(query)
  local params = { query = query or "TargetAccount" } -- An empty query string will request no symbols
  local bufnr = vim.api.nvim_get_current_buf() -- Get the current buffer number

  vim.lsp.buf_request(bufnr, "workspace/symbol", params, function(err, result, ctx, config)
    if err then
      vim.notify("Error during workspace/symbol request: " .. tostring(err), vim.log.levels.ERROR)
      return
    end
    if result and #result > 0 then
      for _, symbol in ipairs(result) do
        local kind = vim.lsp.protocol.SymbolKind[symbol.kind] or "Unknown"
        local line = string.format(
          "[%s] %s %s - %s",
          kind,
          symbol.name,
          symbol.kind,
          (symbol.location and symbol.location.uri) or "No location"
        )
        -- print(line)
        if symbol.kind == 12 or symbol.kind == 6 then -- 12 is Function, 6 is Method
          print("found method or function " .. line)
        end
      end
    else
      print("No symbols found")
    end
  end)
end

-- local function go_to_symbol(symbol)
--   if symbol.location then -- Check if the symbol has a location property
--     -- Convert the URI to a file path if necessary
--     local bufnr = vim.uri_to_bufnr(symbol.location.uri)
--     -- Make sure the buffer is loaded
--     vim.fn.bufload(bufnr)
--
--     -- Extract the line and character position from the symbol's location range
--     local position = symbol.location.range.start
--     local line = position.line + 1 -- Convert from 0-based to 1-based indexing
--     local character = position.character + 1 -- Convert from 0-based to 1-based indexing
--
--     -- Move the cursor to the symbol's location
--     vim.api.nvim_win_set_cursor(0, { line, character })
--   else
--     vim.notify("Symbol does not have a location.", vim.log.levels.WARN)
--   end
-- end

local function go_to_symbol(symbol, bufnr)
  -- Ensure the buffer number is provided, or use the current buffer
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  if symbol.selectionRange then -- Check if the symbol has a selectionRange property
    -- Extract the line and character position from the symbol's selectionRange
    local position = symbol.selectionRange.start
    local line = position.line + 1 -- Convert from 0-based to 1-based indexing
    local character = position.character + 1 -- Convert from 0-based to 1-based indexing

    -- Set the cursor to the symbol's selectionRange start position
    vim.api.nvim_win_set_cursor(0, { line, character })
  else
    vim.notify("Symbol does not have a selectionRange.", vim.log.levels.WARN)
  end
end

function show_picker(symbols)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local action_state = require("telescope.actions.state")
  local actions = require("telescope.actions")
  -- Create a Telescope picker for the symbols
  pickers
    .new({}, {
      prompt_title = "Document Symbols",
      finder = finders.new_table({
        results = symbols,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry.name .. " (" .. entry.kind .. ")",
            ordinal = entry.name,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          local range = selection.value.range
          local position = range.start
          local line = position.line + 1 -- Convert from 0-based to 1-based indexing
          local character = position.character + 1 -- Convert from 0-based to 1-based indexing
          vim.api.nvim_win_set_cursor(0, { line, character })
        end)
        return true
      end,
    })
    :find()
end

local function find_match(hover_result, type_to_match, symbol)
  -- Process the hover result to extract and analyze the type information
  local contents = hover_result.contents
  local value = ""
  if contents.kind then
    -- MarkupContent
    value = contents.value
    -- print("value kind")
  elseif contents.language then
    -- MarkedString
    value = contents.value
    -- print("value language")
  elseif type(contents) == "table" then
    -- Array of MarkedString or MarkupContent
    value = contents[1].value
    -- print("value table")
  else
    -- Plain string
    value = contents
    print("value str")
  end
  -- print("value " .. value .. "looking for match " .. type_to_match)
  -- Check if the function signature includes the type_to_match
  if value:find(type_to_match) then
    print("Matched function: " .. symbol.name)
    return {
      name = symbol.name,
      kind = vim.lsp.protocol.SymbolKind[symbol.kind] or "Unknown",
      range = symbol.selectionRange,
    }

    -- always go to the first
    -- go_to_symbol(symbol)
  end
  return nil
end

local function print_results(results)
  for k, v in ipairs(results) do
    print(" result k" .. k)
  end
end

local function async_fetch_hover(ctx, symbols, type_to_match, on_complete)
  local results = {}
  co = coroutine.create(function()
    print("got async")

    for i, symbol in ipairs(symbols) do
      print("got async with " .. symbol.name)

      local kind = vim.lsp.protocol.SymbolKind[symbol.kind] or "Unknown"
      local line = string.format(
        "[%s] %s %s - %s",
        kind,
        symbol.name,
        symbol.kind,
        (symbol.location and symbol.location.uri) or "No location",
        symbol.selectionRange or "No SelectionRange"
      )
      print(line)

      -- print("looking at symbol " .. symbol.name)
      -- Step 2: Request hover information for each function symbol
      vim.lsp.buf_request(0, "textDocument/hover", {
        textDocument = ctx.params.textDocument,
        position = symbol.selectionRange.start,
        -- textDocument = { uri = symbol.location.uri },
        -- position = symbol.location.range.start,
      }, function(hover_err, hover_result, hover_ctx, hover_config)
        print("got hover response")
        if hover_err then
          vim.notify("Error during textDocument/hover request: " .. tostring(hover_err), vim.log.levels.ERROR)
          assert(not hover_err, hover_err)
          print("err resume")
          coroutine.resume(co, i)
          return
        end
        if hover_result then
          if symbol.kind == 12 or symbol.kind == 6 then -- 12 is Function, 6 is Method
            table.insert(results, find_match(hover_result, type_to_match, symbol))
            print_results(results)
          else
            print("else wrong kind")
            results[i] = nil
            print_results(results)
            -- coroutine.resume(co, i)
          end
        else
          results[i] = nil
        end
        print("main resume")
        coroutine.resume(co, i)
      end)
      -- wait for async
      print("yield")
      print_results(results)
      coroutine.yield()
    end

    -- print("yield2")
    -- coroutine.yield()

    print("on_complete")
    print_results(results)
    on_complete(results)
  end)

  -- start the coroutine
  coroutine.resume(co)
end

function analyze_function_signatures(type_to_match)
  -- look for specific symbol name, as we can't search ALL symbols
  -- local params = { query = query or "client" } -- An empty query string will request no symbols
  -- local bufnr = vim.api.nvim_get_current_buf() -- Get the current buffer number

  local params = { textDocument = vim.lsp.util.make_text_document_params() }

  -- vim.lsp.buf_request(bufnr, "workspace/symbol", params, function(err, result, ctx, config)
  vim.lsp.buf_request(0, "textDocument/documentSymbol", params, function(err, result, ctx, config)
    if err then
      vim.notify("Error during textDocument/documentSymbol request: " .. tostring(err), vim.log.levels.ERROR)
      return
    end
    if result and #result > 0 then
      -- print("got a result")
      -- Filter the results for functions or methods
      print("calling async with ")
      async_fetch_hover(ctx, result, type_to_match, function(results)
        print("got results ")
        print_results(results)
        show_picker(results)
      end)
    else
      print("No symbols found")
    end
  end)
end

-- Example usage: list functions that have 'string' in their signature
-- analyze_function_signatures("string")

-- got markupContent```python
-- (parameter) target_account: TargetAccount
-- ```
