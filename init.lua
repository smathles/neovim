--  _   _                 _
-- | \ | | ___  _____   _(_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |\  |  __/ (_) \ V /| | | | | | |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|
-----------------------------------------------------------------------------------------------------------------------

--[[
TODO: 
	- Fix registers setup!
		- I want to achieve this by:
			- setting the default (clipboard synced) register to be copy-only
		- and then either:
			- setting the "anything" register to be something simple like "" or "+ or even a custom one like ";
		- or:
			- setting the "anything" register to be a leader binding, <leader>p and <leader>P
				- (Note that this is suboptimal for chaining together vim commands, so still do the above concept)
	- Fix clang/c# commenting engines (prefer '//' to '/**/')
--]]

require 'core.setup'
require 'core.keymaps'
require 'core.lazy_init'
