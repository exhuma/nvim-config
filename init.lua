--
-- This module contains a high-level initialisation for NeoVim
--
dynload = require("dynload")

--
-- Load all modules/plugins in a given subfolder.
--
-- Each plugin must expose a no-arg function "run()" to initialiase & configure
-- the plugin. Example:
-- 
--     function run()
--       require('packer').use('tpope/vim-unimpaired')
--     end
--     
--     return {
--       run=run
--     }
-- 
function load_modules(folder)
  local plugins = dynload.load_modules(folder)
  for _, plugin in ipairs(plugins) do
    plugin.run()
  end
end

-- ---------------------------------------------------------------------------

-- Call early boot-strapping code for the rest of the config
bootstrap = require("bootstrap")
bootstrap.run()

load_modules("plugins_d")
load_modules("behaviour")
load_modules("look_and_feel")

-- TODO setup_linter()
-- TODO setup_code_formatter()
-- TODO define_keymappings()
-- TODO define_look_and_feel()
