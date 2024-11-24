return { -- A collection of small QoL plugins
  --[[
  TODO:
 - Add dashboard config!
 - Add buffer close config!
 - Add neotree/LSP integration for renaming
  - This is less important, but should be useful as the LSP won't then have a stronk
    ]]
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        -- { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    quickfile = { enabled = true },
    bufdelete = { enabled = true },
  },
}
-- "Files" startup config
-- {
--   sections = {
--     { section = "header" },
--     { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
--     { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
--     { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
--     { section = "startup" },
--   },
-- }

-- "Doom" startup config
-- {
--   sections = {
--     { section = "header" },
--     { section = "keys", gap = 1, padding = 1 },
--     { section = "startup" },
--   },
-- }
