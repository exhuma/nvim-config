function run() 
  vim.g.mapleader = ' '
  vim.keymap.set("n", "n", "nzz")
  vim.keymap.set("n", "N", "Nzz")
  vim.keymap.set("n", "*", "*zz")
  vim.keymap.set("n", "#", "#zz")
  vim.keymap.set("n", "g*", "g*zz")
  vim.keymap.set("n", "g#", "g#zz")
  vim.keymap.set("n", "j", "gj")
  vim.keymap.set("n", "k", "gk")
  vim.keymap.set("i", "jj", "<Esc>")
  vim.keymap.set("n", "<space>", "<leader>")
  vim.keymap.set("n", "<leader><space>", ":noh<CR>")
  vim.keymap.set("n", "<leader>d", "ddp/=======$<CR>jdd<C-o>P")
  vim.keymap.set("n", "<F4>", 'a<C-R>=strftime("%Y-%m-%d")<CR><ESC>')
  vim.keymap.set("i", "<F4>", '<C-R>=strftime("%Y-%m-%d")<CR>')
  vim.keymap.set("n", "<F5>", 'a<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><ESC>')
  vim.keymap.set("i", "<F5>", '<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>')
  vim.keymap.set("n", "<F6>", 'a<C-R>=strftime("%Y%m%d")<CR><ESC>')
  vim.keymap.set("i", "<F6>", '<C-R>=strftime("%Y%m%d")<CR>')

  -- Behave somewhat like 'less' for toggling word-wrap
  vim.keymap.set("n", "-S", ":set nowrap!<CR>")

  -- TODO Reformat code
  -- TODO nnoremap <C-i> :ALEFix<CR>

end

return {
  run=run
}
