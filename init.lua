--  _   _                 _
-- | \ | | ___  _____   _(_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |\  |  __/ (_) \ V /| | | | | | |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|
-----------------------------------------------------------------------------------------------------------------------

--[[
TODO: Investigate the following:
- blink.cmp
	- Tried this, nvim-cmp wins for now. Investigate in future maybe.
- indent-blankline (vs snacks version)
	- Also work out why it's trying to add stuff for blank lines rip
	- Get rid of the animation it makes when switching to an indented area
- fzf-lua
	- Looks like the way to go in the future
- lazygit
	- Based, but complex. A tool to learn another day maybe.
Also try:
- Snacks terminal
	- And making a snacks window part of the lazygit implementation???
--]]

-- HACK: "cc" = change an entire line
-- "de" and "d$" are pretty cool too
-- -- "U" undoes whatever just happened to the *whole* line!
-- "C-g" shows you cool info
-- "?" is like "/", but backwards lol
-- "C-i" and "C-o" do movement???? Research this lol

-- BUG:
-- This executes when opening a swap file from dashboard (and maybe neotree?)!
--[[
   E5108: Error executing lua: vim/_editor.lua:447: nvim_exec2(), line 1: Vim(edit):E325: ATTENTION                                                            stack traceback:                                                                                                                                                    [C]: in function 'nvim_exec2'                                                                                                                               vim/_editor.lua:447: in function 'action'                                                                                                                   ...ocal/nvim-data/lazy/snacks.nvim/lua/snacks/dashboard.lua:693: in function <...ocal/nvim-data/lazy/snacks.nvim/lua/snacks/dashboard.lua:692> 
--]]

require 'core.setup'
require 'core.keymaps'
require 'core.lazy_init'
