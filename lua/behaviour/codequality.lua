local function run() 
  vim.o.autoindent = true
  vim.o.expandtab = true
  vim.o.shiftround = true
  vim.o.shiftwidth = 4
  vim.o.tabstop = 4
  vim.o.textwidth = 79
end

return {
  run=run
}
