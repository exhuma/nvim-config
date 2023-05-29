--
-- This module contains a high-level initialisation for NeoVim
--
dynload = require("dynload")

function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

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
    local is_success, error_msg = pcall(plugin.module.run)
    if not is_success then
        error(string.format("Error calling %s.run(): %s", plugin.name, error_msg))
    end
  end
end

-- ---------------------------------------------------------------------------

-- Call early boot-strapping code for the rest of the config
bootstrap = require("bootstrap")
bootstrap.run()

load_modules(script_path() .. "/lua/plugins_d")
load_modules(script_path() .. "/lua/behaviour")
load_modules(script_path() .. "/lua/look_and_feel")

-- TODO setup_linter()
-- TODO setup_code_formatter()
-- TODO define_keymappings()
-- TODO define_look_and_feel()
