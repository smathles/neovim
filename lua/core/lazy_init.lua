--  ___ _           _
-- | _ \ |_  _ __ _(_)_ _  ___
-- |  _/ | || / _` | | ' \(_-<
-- |_| |_|\_,_\__, |_|_||_/__/
--            |___/

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Install/import plugins specified in lua/plugins directory
require('lazy').setup { import = 'plugins' }
