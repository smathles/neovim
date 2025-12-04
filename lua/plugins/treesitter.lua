return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  -- branch = 'main',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'hyprlang', 'rust' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = {
      enable = true,
      disable = 'ruby',
    },
    fold = {
      enable = true,
      disable = 'ruby',
    },
    fold_extra = {
      enable = true,
      disable = 'ruby',
    },
  },
  config = function(_, opts)
    -- Add filetype detection for custom patterns
    vim.filetype.add {
      extension = { rasi = 'rasi' },
      pattern = {
        ['.*/kitty/*.conf'] = 'bash',
        ['.*/hypr/.*%.conf'] = 'hyprlang', -- Detect Hyprland config files
      },
    }
    require('nvim-treesitter').setup(opts)
  end,
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

  -- NOTE: In the future, the master treesitter branch will be deprecated and modules will no longer exist. Keep the above config for now.

  -- 'nvim-treesitter/nvim-treesitter',
  -- lazy = false,
  -- branch = 'main',
  -- build = ':TSUpdate',
}
