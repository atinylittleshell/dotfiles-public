require('lspsaga').setup({
  symbol_in_winbar = {
    enable = false,
  },
  lightbulb = {
    virtual_text = false,
  },
  diagnostic = {
    on_insert = false,
  },
  code_action = {
    keys = {
      quit = '<ESC>',
      exec = '<CR>',
    },
  },
})
