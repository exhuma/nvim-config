--
-- This module contains function to help dynamically load LUA modules
--

--
-- Load all modules inside *base_folder* and return the loaded modules as a table
--
function load_modules(base_folder)
  local fn = vim.fn
  local result = fn.systemlist({'ls', '-1', base_folder})
  local output = {}
  for _, str in ipairs(result) do
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
