--  ___      _
-- / __| ___| |_ _  _ _ __
-- \__ \/ -_)  _| || | '_ \
-- |___/\___|\__|\_,_| .__/
--                   |_|

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use nerd font if available
vim.g.have_nerd_font = true

-- Remove tilde characters!
vim.opt.fillchars = { eob = ' ' }

-- Make line numbers default
vim.opt.number = true

-- Optionally add relative line numbers, to help with jumping.
-- vim.opt.relativenumber = true

vim.opt.mouse = 'a' -- Enable mouse mode
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'no'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Add in termguicolors for the bufferline plugin (they're also just good)
vim.opt.termguicolors = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- TODO: This does not account for :%y or delete/change/substitute yet!
-- What this really needs to be able to do is:
--  - yank commands go to clipboard by default, whether 'y', 'yy', ':%y'
--  - change/delete/substitute go to '""' by default
--

-- local function map(mode, input, override, opts)
--   opts = opts or {}
--   vim.keymap.set(mode, input, override, opts)
-- end
--
-- -- Explicitly set the empty register so it still works after we override it by default
-- map('n', '""y', '""y')
-- map('n', '""yy', '""yy')
-- map('n', '""p', '""p')
-- map('n', '""P', '""P')
--
-- local function clipboard_fallback(cmd)
--   return function()
--     return (vim.v.register == '"' and '"+' or '') .. cmd
--   end
-- end
--
-- -- Override "" register copy-paste commands to "+ register
-- map('n', 'y', clipboard_fallback 'y', { expr = true })
-- map('n', 'yy', clipboard_fallback 'yy', { expr = true })
-- map('n', 'p', clipboard_fallback 'p', { expr = true })
-- map('n', 'P', clipboard_fallback 'P', { expr = true })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
