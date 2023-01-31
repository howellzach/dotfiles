require'pounce'.setup{
  accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
  accept_best_key = "<enter>",
  multi_window = true,
  debug = false,
}

vim.keymap.set('n', 's', vim.cmd.Pounce)
vim.keymap.set('n', 'S', vim.cmd.PounceRepeat)
vim.keymap.set('v', 's', vim.cmd.Pounce)
