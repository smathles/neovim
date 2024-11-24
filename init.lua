--  _   _                 _
-- | \ | | ___  _____   _(_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |\  |  __/ (_) \ V /| | | | | | |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|
-----------------------------------------------------------------------------------------------------------------------
--[[
TODO: 
- Configure neo-tree to:
    - Open to cwd of whichever file is currently open (obviously not the tree window though)
    - Hitting "enter" in the tree will open that file in a new window tab, not override current windows
    - IDK other keybindings?
    - Figure out how to open directories in neotree? Recursively? Non-Recursively?
    - How to find directories using the "/" search functionality?
- Configure tab-manager-plugin-of-some-sort to:
    - Have clickable "X's" to close
    - Navigate using alt+tab and alt+shift+tab
    - New files using alt+t and close tabs using alt+w?
- Configure code-runner to:
    - IDK run code?

2024/11/12:
- Style choices:
  - Statusbar: I like halfway between Astronvim and LazyVim
  - I like NvChad's tabline stuff, especially alt+tab to shift neovim-specific tabs!
    - Also implement alt+w and alt+t to close and open new files respectively.
  - I'm sick of the bad search functionality in neo-tree. Use NvChad's file explorer!
- REMAP x AND d TO NOT GET SAVED TO THE REGISTER!!!!! 
  - Or at least move them to a "deleted" register, rather than my beloved normal "default, global clipboard" register.

2024/11/19:
- Maybe group plugins by type?
    - like UI (lualine/bufferline/colourscheme), backend (linting, treesitter, LSP) etc
    - group by singular file or further directories?

TJ's interesting stuff!:
    After understanding a bit more about Lua, you can use `:help lua-guide` as a
  reference for how Neovim integrates Lua.
    - :help lua-guide

    Kickstart provides a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.
--]]
-----------------------------------------------------------------------------------------------------------------------
--[[
FIXME:
NEOTREE:
- opening neovim in a directory doesn't change the path
- make it dynamically reloading, update directory displayed when directory is changed via command or maybe file focused.
LUALINE:
- Doesn't work properly on neotree.
- doesn't display keystrokes entered
BUFFERLINE:
- want to be able to close tab with middle click
TODO-COMMENTS:
- make highlighting consistent!

TODO:
- Make colourscheme global somehow? Not sure how to do this (---@param or something like that?)
- Disable middle-click paste!
--]]
require 'core.setup'
require 'core.keymaps'
require 'core.lazy_init'
