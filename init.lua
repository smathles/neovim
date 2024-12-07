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

2024/11/12:
- Style choices:
- REMAP x AND d TO NOT GET SAVED TO THE REGISTER!!!!! 
  - Or at least move them to a "deleted" register, rather than my beloved normal "default, global clipboard" register.

TJ's interesting stuff!:
    After understanding a bit more about Lua, you can use `:help lua-guide` as a
  reference for how Neovim integrates Lua.
    - :help lua-guide
--]]
-----------------------------------------------------------------------------------------------------------------------
--[[
FIXME:
NEOTREE:
- opening neovim in a directory doesn't change the path
- make it dynamically reloading, update directory displayed when directory is changed via command or maybe file focused.
- still uses netrw by defaulto
- Need to implement:
    - handling for closing by ":q" when the neotree window thing is open.
    - I think Nvimtree does this better slightly.
    - Make it so that when neo-tree is in "fullscreen" mode, opening a buffer window will set it to be in "docked" mode, such that if the neo-tree is closed and opened again (using leader + e), it will now be in docked mode.
LUALINE:
- Doesn't work properly on neotree.
UFO:
- make comment blocks fold as well

TODO:
As in GitHub!
- But like maybe also write a "watcher" function that checks for git status updates and directory changes when a cmd is sent, and updates Neotree.
- Also write a function that handles "nvim dir/to/open/in" and manages the path and neotreedisplay in netrw mode.
--]]
require 'core.setup'
require 'core.keymaps'
require 'core.lazy_init'
