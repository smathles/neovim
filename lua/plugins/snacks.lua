return { -- A collection of small QoL plugins
  --[[
  TODO:
 - Add neotree/LSP integration for renaming
  - This is less important, but should be useful as the LSP won't then have a stronk
    ]]
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    quickfile = { enabled = true },
    bufdelete = { enabled = true },
    bigfile = { enabled = true },
    terminal = {
      win = {
        style = 'terminal',
        position = 'float',
      },
    },
  },
}
-- vim.keymap.set('n', '<leader>t', function()
-- require('snacks').terminal()
-- end, {desc = '[T]oggle terminal'})
