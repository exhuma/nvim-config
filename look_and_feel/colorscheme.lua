function run() 
  require('packer').use('romainl/Apprentice')
  vim.cmd [[colorscheme apprentice]]
end

return {
  run=run
}
