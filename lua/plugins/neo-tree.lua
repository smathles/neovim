--[[
TODO:
This plugin still has the following issues:
- opening neovim in a directory doesn't change the path
--]]
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- '3rd/image.nvim', -- cool, but might increase time for neo-tree to open
  },
  cmd = 'Neotree',
  keys = {
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
      end,
      desc = 'File [e]xplorer (cwd)',
    },
    {
      '<leader>E',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.uv.os_homedir() }
      end,
      desc = 'File [E]xplorer (home)',
    },
  },
  opts = {
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      width = 25,
      mappings = {
        ['<space>'] = false,
        ['Y'] = { -- Yank filepath to clipboard!
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg('+', path, 'c')
          end,
          desc = 'Copy Path to Clipboard',
        },
        ['P'] = { 'toggle_preview', config = { use_float = false } },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
      git_status = {
        symbols = {
          unstaged = '󰄱',
          staged = '󰱒',
        },
      },
    },
  },
}
-- {
--   "nvim-neo-tree/neo-tree.nvim",
--   opts = function(_, opts)
--     local function on_move(data)
--       Snacks.rename.on_rename_file(data.source, data.destination)
--     end
--     local events = require("neo-tree.events")
--     opts.event_handlers = opts.event_handlers or {}
--     vim.list_extend(opts.event_handlers, {
--       { event = events.FILE_MOVED, handler = on_move },
--       { event = events.FILE_RENAMED, handler = on_move },
--     })
--   end,
-- }
