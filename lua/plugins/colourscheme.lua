return { -- Set global colourscheme
  'ellisonleao/gruvbox.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    require('gruvbox').setup {
      italic = {
        comments = true,
      },
      overrides = {
        SignColumn = { bg = '#282828' }, -- Make signcolumn color be consistent with rest of colourscheme
      },
    }
    vim.cmd.colorscheme 'gruvbox'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
