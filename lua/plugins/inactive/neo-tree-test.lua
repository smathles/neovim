return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      {
        's1n7ax/nvim-window-picker',
        version = '2.*',
        config = function()
          require('window-picker').setup {
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              bo = {
                filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
                buftype = { 'terminal', 'quickfix' },
              },
            },
          }
        end,
      },
    },
    config = function()
      vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

      require('neo-tree').setup {
        close_if_last_window = false,
        popup_border_style = 'rounded',
        enable_git_status = true,
        enable_diagnostics = true,
        open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
        sort_case_insensitive = false,
        sort_function = nil,
        default_component_configs = {
          container = { enable_character_fade = true },
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = '│',
            last_indent_marker = '└',
            highlight = 'NeoTreeIndentMarker',
            expander_collapsed = '',
            expander_expanded = '',
            expander_highlight = 'NeoTreeExpander',
          },
          icon = {
            folder_closed = '',
            folder_open = '',
            folder_empty = '󰜌',
            provider = function(icon, node, state)
              if node.type == 'file' or node.type == 'terminal' then
                local success, web_devicons = pcall(require, 'nvim-web-devicons')
                local name = node.type == 'terminal' and 'terminal' or node.name
                if success then
                  local devicon, hl = web_devicons.get_icon(name)
                  icon.text = devicon or icon.text
                  icon.highlight = hl or icon.highlight
                end
              end
            end,
            default = '*',
            highlight = 'NeoTreeFileIcon',
          },
          modified = { symbol = '[+]', highlight = 'NeoTreeModified' },
          name = { trailing_slash = false, use_git_status_colors = true, highlight = 'NeoTreeFileName' },
          git_status = {
            symbols = {
              added = '',
              modified = '',
              deleted = '✖',
              renamed = '󰁕',
              untracked = '',
              ignored = '',
              unstaged = '󰄱',
              staged = '',
              conflict = '',
            },
          },

          file_size = { enabled = true, width = 12, required_width = 64 },
          type = { enabled = true, width = 10, required_width = 122 },
          last_modified = { enabled = true, width = 20, required_width = 88 },
          created = { enabled = true, width = 20, required_width = 110 },
          symlink_target = { enabled = false },
        },
        commands = {},
        window = {
          position = 'left',
          width = 40,
          mapping_options = { noremap = true, nowait = true },
          mappings = {
            ['<space>'] = { 'toggle_node', nowait = false },
            ['<2-LeftMouse>'] = 'open',
            ['<cr>'] = 'open',
            ['<esc>'] = 'cancel',
            ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
            ['l'] = 'focus_preview',
            ['S'] = 'open_split',
            ['s'] = 'open_vsplit',
            ['t'] = 'open_tabnew',
            ['w'] = 'open_with_window_picker',
            ['C'] = 'close_node',
            ['z'] = 'close_all_nodes',
            ['a'] = { 'add', config = { show_path = 'none' } },
            ['A'] = 'add_directory',
            ['d'] = 'delete',
            ['r'] = 'rename',
            ['y'] = 'copy_to_clipboard',
            ['x'] = 'cut_to_clipboard',
            ['p'] = 'paste_from_clipboard',
            ['c'] = 'copy',
            ['m'] = 'move',
            ['q'] = 'close_window',
            ['R'] = 'refresh',
            ['?'] = 'show_help',
            ['<'] = 'prev_source',
            ['>'] = 'next_source',
            ['i'] = 'show_file_details',
          },
        },
        nesting_rules = {},
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true,
            hide_by_name = {},
            hide_by_pattern = {},
            always_show = {},
            always_show_by_pattern = {},
            never_show = {},
            never_show_by_pattern = {},
          },
          follow_current_file = {
            enabled = false,
            leave_dirs_open = false,
          },
          group_empty_dirs = false,
          hijack_netrw_behavior = 'open_default',
          use_libuv_file_watcher = false,
          window = {
            mappings = {
              ['<bs>'] = 'navigate_up',
              ['.'] = 'set_root',
              ['H'] = 'toggle_hidden',
              ['/'] = 'fuzzy_finder',
              ['D'] = 'fuzzy_finder_directory',
              ['#'] = 'fuzzy_sorter',
            },
          },
        },
      }

      vim.api.nvim_set_keymap(
        'n',
        '<leader>e',
        "<cmd>lua require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }<CR>",
        { noremap = true, silent = true, desc = 'File [e]xplorer (cwd)' }
      )
      vim.api.nvim_set_keymap(
        'n',
        '<leader>E',
        "<cmd>lua require('neo-tree.command').execute { toggle = true, dir = vim.uv.os_homedir() }<CR>",
        { noremap = true, silent = true, desc = 'File [E]xplorer (home)' }
      )
    end,
  },
}

-- OK, bugs with this setup:
--  - looks like the directory memory is bork:
--  - looks like space functionality isn't removed:
--  - overriding netrw is laggy and not in "fullscreen" mode (I forgor what it's called, position=current or smthn).
--
