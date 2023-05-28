--
-- This module contains code that needs to be executed as early as possible
-- during vim startup.
--
-- The module exposes the entry-point "run()"
--
-- Example:
-- 
--     require("bootstrap").run()
--

--
-- Make sure that the "packer" plugin manager is available.
--
-- If it is not available, automatically clone the repo and make it available
-- to vim
-- 
function ensure_packer()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

--
-- Main entry point for this module
--
function run()
  local is_new_install = ensure_packer()
  require('packer').startup(
    function(use)
      use 'wbthomason/packer.nvim'
      if is_new_install then
        require('packer').sync()
      end
    end
  )
end

return {
  run=run
}
