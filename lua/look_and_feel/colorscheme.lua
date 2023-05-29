local function config()
  vim.cmd [[colorscheme apprentice]]
end

local function run() 
  require('packer').use({'romainl/Apprentice', config=config})
end

return {
  run=run
}
