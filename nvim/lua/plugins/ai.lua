return {
  {
    'github/copilot.vim',
    lazy = false,
    priority = 51,
  },
  {
    'David-Kunz/gen.nvim',
    opts = {
      model = 'codellama:13b',
      display_mode = 'float',
    },
  },
}
