return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'ellisonleao/gruvbox.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Load the colorscheme here.
    -- Override the palette with your custom colors.
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
