return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- set to "tabs" to only show tabpages instead
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
        buffer_close_icon = '',
        close_icon = '',
        path_components = 1, -- Show only the file name without the directory
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 20,
        diagnostics = true, --false,
        diagnostics_update_in_insert = true, --false,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        show_tab_indicators = false,
        indicator = {
          style = 'none',
        },
        icon_pinned = '󰐃',
        minimum_padding = 1,
        maximum_padding = 5,
        maximum_length = 15,
        sort_by = 'insert_at_end',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'center',
            separator = true,
          },
        },
      },
      highlights = {
        offset_separator = {
          bg = '#282828', -- Gruvbox background, find a better way to declare this
        },
        separator = {
          fg = '#434C5E', -- Gruvbox blue, find a better way to declare this
        },
        buffer_selected = {
          bold = true,
          italic = true,
        },
        -- separator_selected = {},
        -- tab_selected = {},
        -- background = {},
        -- indicator_selected = {},
        -- fill = {},
      },
    }
  end,
}
-- return {
--   'akinsho/bufferline.nvim',
--   event = 'VeryLazy',
--   keys = {
--     { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
--     { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
--     { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
--     { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
--     { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
--     { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
--     { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
--     { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
--     { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
--     { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
--   },
--   opts = {
--     options = {
--       -- stylua: ignore
--       close_command = function(n) Snacks.bufdelete(n) end,
--       -- stylua: ignore
--       right_mouse_command = function(n) Snacks.bufdelete(n) end,
--       diagnostics = 'nvim_lsp',
--       always_show_bufferline = false,
--       diagnostics_indicator = function(_, _, diag)
--         local icons = LazyVim.config.icons.diagnostics
--         local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
--         return vim.trim(ret)
--       end,
--       offsets = {
--         {
--           filetype = 'neo-tree',
--           text = 'Neo-tree',
--           highlight = 'Directory',
--           text_align = 'left',
--         },
--       },
--       ---@param opts bufferline.IconFetcherOpts
--       get_element_icon = function(opts)
--         return LazyVim.config.icons.ft[opts.filetype]
--       end,
--     },
--   },
--   config = function(_, opts)
--     require('bufferline').setup(opts)
--     -- Fix bufferline when restoring a session
--     vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
--       callback = function()
--         vim.schedule(function()
--           pcall(nvim_bufferline)
--         end)
--       end,
--     })
--   end,
-- }
