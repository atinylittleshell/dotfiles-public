local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    mappings = {
      n = {
        ['q'] = actions.close,
      },
    },
  },
  pickers = {
    buffers = {
      initial_mode = 'normal',
    },
  },
})
