function config()
  vim.cmd [[colorscheme apprentice]]
  print(1)
end

function run() 
  require('packer').use({'romainl/Apprentice', config=config})
end

return {
  run=run
}
