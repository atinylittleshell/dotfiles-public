require('lspsaga').init_lsp_saga({
  code_action_lightbulb = {
    cache_code_action = false,
    virtual_text = false,
  },
  code_action_keys = {
    quit = '<ESC>',
    exec = '<CR>',
  },
  definition_action_keys = {
    quit = '<ESC>',
    open = '<CR>',
  },
})
