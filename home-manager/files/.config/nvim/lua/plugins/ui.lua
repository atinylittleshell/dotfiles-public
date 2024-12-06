local rose_pine_theme = require('lualine.themes.rose-pine')
rose_pine_theme.normal.c.bg = 'NONE'
rose_pine_theme.insert.c.bg = 'NONE'
rose_pine_theme.visual.c.bg = 'NONE'
rose_pine_theme.replace.c.bg = 'NONE'
rose_pine_theme.command.c.bg = 'NONE'
rose_pine_theme.inactive.c.bg = 'NONE'

return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'ColorScheme',
    opts = {
      options = {
        theme = rose_pine_theme,
        globalstatus = true,
        icons_enabled = false,
        component_separators = '',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = {
          'branch',
          'diff',
        },
        lualine_z = {},
      },
      winbar = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = { 'diagnostics' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  {
    'stevearc/oil.nvim',
    version = '*',
    opts = {
      columns = {},
      buf_options = {
        buflisted = false,
      },
      view_options = {
        show_hidden = true,
      },
    },
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'levouh/tint.nvim',
    event = 'WinNew',
    opts = {},
  },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    event = 'VeryLazy',
    opts = function()
      return {
        draw = {
          delay = 50,
          animation = require('mini.indentscope').gen_animation.none(),
        },
      }
    end,
  },
  {
    'ggandor/leap.nvim',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    'Bekaboo/deadcolumn.nvim',
    version = '*',
    event = 'VeryLazy',
  },
  {
    'moll/vim-bbye',
    event = 'VeryLazy',
  },
  {
    'numToStr/Comment.nvim',
    version = '*',
    event = 'BufWinEnter',
    config = true,
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = true,
  },
  {
    'folke/which-key.nvim',
    version = '*',
    lazy = false,
    priority = 900,
    config = true,
  },
  {
    'gbprod/substitute.nvim',
    opts = {},
  },
  {
    'karb94/neoscroll.nvim',
    opts = {},
  },
  {
    'MagicDuck/grug-far.nvim',
    opts = {
      engines = {
        ripgrep = {
          extraArgs = '--color=never --smart-case --hidden --glob=!.git/* --max-filesize=1M',
        },
      },
    },
  },
}
