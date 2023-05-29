local function run() 
  vim.o.wildmenu = true
  vim.o.cmdheight = 2
  vim.o.scrolloff = 7
  vim.o.pastetoggle = "<F3>"
  vim.o.ignorecase = true
  vim.o.backspace = "indent,eol,start"
  vim.o.smartcase = true
  vim.o.wrap = true
  vim.o.breakindent = true
  vim.o.breakindentopt = "shift:3"
  vim.o.showbreak = '… '
  vim.o.hlsearch = true
  vim.o.cursorline = true
  vim.o.incsearch = true
  vim.o.showmatch = true
  vim.o.ruler = true
  vim.o.showcmd = true
  -- Highlight the column where the text should wrap
  vim.o.colorcolumn="+1"
  vim.o.mouse = false

  vim.o.list = true
  vim.o.listchars = table.concat(
    {
      "tab:├─",
      "trail:␣",
      "extends:→",
      "precedes:←",
      "nbsp:◊",
    },
    ","
  )
end

return {
  run=run
}
