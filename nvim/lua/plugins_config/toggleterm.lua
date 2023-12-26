require('toggleterm').setup({
  hide_numbers = true,
  shade_terminals = false,
  start_in_insert = true,
  persist_mode = false,
  open_mapping = [[<leader>t]],
  insert_mappings = true,
  terminal_mappings = false,
  close_on_exit = true,
  auto_scroll = true,
  autochdir = true,
  direction = 'vertical',
  size = 80,
})
