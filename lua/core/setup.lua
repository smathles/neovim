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

-- Remove trailing tilde characters!
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

-- Keep signcolumn off by default
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
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Make clipboard default all non-yank commands to "" register (similar to normal OS behaviour)
--  BUG: This approach does not account for command mode deletions! (:delete, etc)
vim.api.nvim_set_keymap('n', 'd', '""d', { noremap = true })
vim.api.nvim_set_keymap('n', 'c', '""c', { noremap = true })
vim.api.nvim_set_keymap('n', 's', '""s', { noremap = true })
vim.api.nvim_set_keymap('n', 'x', '""x', { noremap = true })
vim.api.nvim_set_keymap('v', 'd', '""d', { noremap = true })
vim.api.nvim_set_keymap('v', 'c', '""c', { noremap = true })
vim.api.nvim_set_keymap('v', 's', '""s', { noremap = true })
vim.api.nvim_set_keymap('v', 'x', '""x', { noremap = true })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
