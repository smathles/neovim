--  _  __
-- | |/ /___ _  _ _ __  __ _ _ __ ___
-- | ' </ -_) || | '  \/ _` | '_ (_-<
-- |_|\_\___|\_, |_|_|_\__,_| .__/__/
--           |__/           |_|

local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [q]uickfix list' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open [d]iagnostic float' })

-- Exit terminal mode in the builtin terminal with a nicer shortcut
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-[><C-[>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>') -- Next buffer with tab (in normal mode)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>') -- Previous buffer with shift + tab (in normal mode)
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' }) -- Next buffer with leader + b + n
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' }) -- Previous buffer with leader + b + p
vim.keymap.set('n', '<leader>ba', '<cmd> enew <CR>', { desc = 'New buffer' }) -- New buffer with leader + b + a

-- Snacks Buffer handling to retain window conditions on buffer close
vim.keymap.set('n', '<leader>bx', function()
  require('snacks').bufdelete()
end, { desc = 'Close current buffer' })

vim.keymap.set('n', '<leader>bq', function()
  require('snacks').bufdelete.all()
end, { desc = 'Close all buffers' })

-- Add in shift+tab to dedent lines in insert mode
-- TODO: Make this work for mid-line "tabs" as well
vim.keymap.set('i', '<S-Tab>', '<C-\\><C-N><<<C-\\><C-N>^i')

-- Add in VS Code-esque commenting binds. Note this might not work in all terminal emulators.
vim.keymap.set('n', '<C-/>', 'gcc', { desc = '[c]omment line', remap = true })
vim.keymap.set('v', '<C-/>', 'gc', { desc = '[c]omment line', remap = true })
vim.keymap.set('i', '<C-/>', '<C-o>gcc', { desc = '[c]omment line', remap = true }) -- NOTE: This teleports you to the beginning of the line. Why?

-- WARNING: HERETICAL CODE INCOMING:

-- Add bindings to delete whole words in insert mode
vim.keymap.set('i', '<C-BS>', '<C-w>', opts)
vim.keymap.set('i', '<C-Del>', '<C-o>dw', opts)

--Rebind the command key ':' to ';'
-- vim.keymap.set({ 'n', 'v' }, ';', ':', opts)

-- Rebind the save command to ctrl-s
vim.keymap.set({ 'n', 'v' }, '<C-s>', '<Cmd>w<CR>', opts)

-- Rebind the quit command to ctrl-q
-- vim.keymap.set({ 'n', 'v' }, '<C-q>', '<Cmd>q<CR>', opts)
