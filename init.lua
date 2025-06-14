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

require 'core.setup'
require 'core.keymaps'
require 'core.lazy_init'
