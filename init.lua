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
--]]

--[[
-- 1 yes cheese
-- 2 yes cheese
-- 5 yes cheese
-- 6 yes cheese
-- 7 yes cheese
-- 8 es chese
-- 9 yes cheese
--]]
--
--
--
--
--
--
--
-- TODO: Test all delete options (dd, visual mode --> d, visual mode + <CR> character -->, daw (probably same as dd, but check)), test all substitute, change operations!
--[[
--
--
--
--
--
--
--
--
-- NORMAL MODE:
-- Summary Command: "[variable] --> dd
--
-- With 'd' set to '""d', "0 and "1 are populated, "" is populated, + is not affected.    -- I literally don't know why both 0 and 1 are filled. 
-- With 'd' set to '"0d', "0 and "1 are populated, "" is populated, + is not affected.    -- Explicitly told to go to 0, goes to 1 as well because it's a delete operation. No pushing values along, 0 is not connected inherently to 1.
-- With 'd' set to '"1d', "1 and "2 are populated, "" is populated, + is not affected.    -- Explicitly told to go to 1, THEN goes to 1 as well (because it's a delete operation), which pushes the initial explicit location to position 2.
-- With 'd' set to '"2d', "1 and "3 are populated, "" is populated, + is not affected.    -- Explicitly told to go to 2, then goes to 1 as well because it's a delete operation, which pushes the initial explicit location to position 3.
-- With 'd' set to '"3d', "1 and "4 are populated, "" is populated, + is not affected.    -- Explicitly told to go to 3, then goes to 1 as well because it's a delete operation, which pushes the initial explicit location to position 4.
-- With 'd' set to '"7d', "1 and "8 are populated, "" is populated, + is not affected.    -- Explicitly told to go to 7, then goes to 1 as well because it's a delete operation, which pushes the initial explicit location to position 8.
-- With 'd' set to '"_d', nothing is populated.       -- /dev/null equivalent, nothing happens as expected.
--
-- VISUAL MODE(S):
-- Summary Command: v/V --> [selection/motion] --> "" --> x/X
--
-- If it's too small (normally -), it gets sent to the " and 0 registers.
-- If it's big enough (normally "), it gets sent to the " and 0 registers.
-- If it's too small (normally -), AND IT HAS A <CR> MARK ON THE END, it gets sent to the " and 0 and 1 registers.
-- If it's big enough (normally ") AND IT HAS A <CR> MARK ON THE END, it gets sent to the " and 0 and 1 registers.
--
--
--
--
-- theThis hens with 'x' in visual mode too, just the same way as 
-- With 'x' in V-line mode, this functions just the same as 'd' (+, ", 1)
-- With 'x' or 'X' in normal mode, this goes to the " register (as expected) BUT ALSO 0! Why!?
--]]

require 'core.setup'
require 'core.keymaps'
require 'core.lazy_init'
