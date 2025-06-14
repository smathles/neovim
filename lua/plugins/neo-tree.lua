return {

  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  lazy = false, -- Load this quickly to make sure netrw behaviour loads immediately!
  priority = 1000,

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },

  keys = {
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
      end,
      desc = 'File [e]xplorer (cwd)',
    },
  },

  config = function()
    require('neo-tree').setup {
      open_files_do_not_replace_types = { 'terminal' },
      close_if_last_window = true,
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'open_current',
        use_libuv_file_watcher = true,
      },
      window = {
        width = 25,
        mappings = {
          ['<space>'] = false,
          ['Y'] = { -- Yank filepath to clipboard!
            -- FIXME: This does not return a message to notifications, or open a window, or highlight that group
            -- TODO: setup the highlight function like in the autocommand setup
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg('+', path, 'c')
            end,
            desc = 'Copy Path to Clipboard',
          },
          ['P'] = { 'toggle_preview', config = { use_float = true } },
          ['<bs>'] = 'navigate_up',
          ['.'] = 'set_root',
          ['D'] = 'fuzzy_finder_directory',
          ['#'] = 'fuzzy_sorter',
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
    }
  end,
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

--[[
NOTE: For inexplicable reasons, this needs to be a "config = function()" setup for the netrw hijacking to work properly. Idk why, but it works! I'm sure I could debug it and turn it back into "opts = {}" setup, but frankly idrc right now.
--]]
