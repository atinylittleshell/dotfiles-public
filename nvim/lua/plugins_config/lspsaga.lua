require('lspsaga').setup({
  symbol_in_winbar = {
    enable = false,
  },
  lightbulb = {
    virtual_text = false,
  },
  finder = {
    keys = {
      expand_or_jump = '<CR>',
    },
  },
  diagnostic = {
    on_insert = false,
    keys = {
      quit_in_show = { 'q', '<ESC>' },
    },
  },
  code_action = {
    keys = {
      quit = { 'q', '<ESC>' },
      exec = '<CR>',
    },
  },
})
