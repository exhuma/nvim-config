--
-- This module contains function to help dynamically load LUA modules
--


--
-- Load all modules inside *base_folder* and return the loaded modules as a table
--
function load_modules(base_folder)
  local handle = io.popen('ls -1 "' .. base_folder .. '"')
  local result = handle:read("*a")
  handle:close()
  local output = {}
  for str in string.gmatch(result, "([^\n]+)") do
    local bar = string.match(str, "(.*).lua")
    if bar ~= nil then
      local mod = require(base_folder .. '.' .. bar)
      table.insert(output, mod)
    end
  end
  return output
end

return {
  load_modules=load_modules
}
