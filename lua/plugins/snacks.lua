return { -- A collection of small QoL plugins
  --[[
   TODO:
  Add neotree/LSP integration for renaming
  This is less important, but should be useful as the LSP won't then have a stronk
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
    indent = {
      enabled = true,
      -- Note: this needs better config in future!
    },
    lazygit = {
      enabled = true,
      -- Note: I don't have lazygit installed lol
    },
    bufdelete = { enabled = true },
    quickfile = { enabled = true },
    bigfile = { enabled = true },
    terminal = {
      win = {
        style = 'terminal',
        position = 'float',
        -- :lua Snacks.terminal.toggle()
      },
    },
  },
  keys = {
    vim.keymap.set('n', '<leader>tt', function()
      require('snacks').terminal.toggle()
    end, { desc = '[T]oggle terminal' }),
  },
}
