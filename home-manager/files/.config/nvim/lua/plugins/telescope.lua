return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    lazy = false,
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          sorting_strategy = 'ascending',
          preview = {
            filesize_limit = 0.1,
          },
          path_display = {
            'smart',
          },
          mappings = {
            n = {
              ['q'] = actions.close,
              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
            },
          },
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob=!.git/*',
          },
        },
        pickers = {
          find_files = {
            find_command = {
              'fd',
              '--type',
              'f',
              '--color=never',
              '--hidden',
              '--follow',
              '-E',
              '.git/*',
            },
          },
          buffers = {
            initial_mode = 'normal',
          },
        },
      })
    end,
  },
}
