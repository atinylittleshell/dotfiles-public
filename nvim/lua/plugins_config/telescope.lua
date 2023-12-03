local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    path_display = {
      'smart',
    },
    mappings = {
      n = {
        ['q'] = actions.close,
        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    buffers = {
      initial_mode = 'normal',
    },
  },
})
