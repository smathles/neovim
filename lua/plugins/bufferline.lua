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
        diagnostics = true,
        diagnostics_update_in_insert = true,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        enforce_regular_tabs = false, -- if this is true, prefixes don't work!
        always_show_bufferline = false,
        show_tab_indicators = false,
        show_duplicate_prefix = true,
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
          bg = '#282828', -- TODO: Gruvbox background, find a better way to declare this
        },
        separator = {
          fg = '#434C5E', -- TODO: Gruvbox blue, find a better way to declare this
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
--   dependencies = {
--     'moll/vim-bbye',
--     'nvim-tree/nvim-web-devicons',
--   },
--   config = function()
--     require('bufferline').setup {
--       options = {
--         mode = 'buffers', -- set to "tabs" to only show tabpages instead
--         themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
--         numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
--         close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
--         buffer_close_icon = '',
--         close_icon = '',
--         path_components = 1, -- Show only the file name without the directory
--         modified_icon = '●',
--         left_trunc_marker = '',
--         right_trunc_marker = '',
--         max_name_length = 30,
--         max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
--         tab_size = 20,
--         diagnostics = true,
--         diagnostics_update_in_insert = true,
--         color_icons = true,
--         show_buffer_icons = true,
--         show_buffer_close_icons = true,
--         show_close_icon = true,
--         persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
--         enforce_regular_tabs = true,
--         always_show_bufferline = false,
--         show_tab_indicators = false,
--         show_duplicate_prefix = true,
--         indicator = {
--           style = 'none',
--         },
--         icon_pinned = '󰐃',
--         minimum_padding = 1,
--         maximum_padding = 5,
--         maximum_length = 15,
--         sort_by = 'insert_at_end',
--         offsets = {
--           {
--             filetype = 'neo-tree',
--             text = 'Neo-tree',
--             highlight = 'Directory',
--             text_align = 'center',
--             separator = true,
--           },
--         },
--       },
--       highlights = {
--         offset_separator = {
--           bg = '#282828', -- TODO: Gruvbox background, find a better way to declare this
--         },
--         separator = {
--           fg = '#434C5E', -- TODO: Gruvbox blue, find a better way to declare this
--         },
--         buffer_selected = {
--           bold = true,
--           italic = true,
--         },
--         -- separator_selected = {},
--         -- tab_selected = {},
--         -- background = {},
--         -- indicator_selected = {},
--         -- fill = {},
--       },
--     }
--   end,
-- }
