--
-- This module contains function to help dynamically load LUA modules
--

--
-- Load all modules inside *base_folder* and return the loaded modules as a table
--
function load_modules(base_folder)
  local fn = vim.fn
  local result = fn.systemlist({'ls', '-1', base_folder})
  local namespace = string.match(base_folder, ".*/(.*)")
  local output = {}
  for _, str in ipairs(result) do
    local basename = string.match(str, "(.*).lua")
    if basename ~= nil then
      name = namespace .. '.' .. basename
      local mod = require(name)
      table.insert(output, {name=name, module=mod})
    end
  end
  return output
end

return {
  load_modules=load_modules
}
