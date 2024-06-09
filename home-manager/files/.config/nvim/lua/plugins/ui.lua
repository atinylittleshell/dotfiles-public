return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'ColorScheme',
    opts = {
      options = {
        theme = 'rose-pine',
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
    'tris203/precognition.nvim',
    config = {
      -- startVisible = true,
      -- showBlankVirtLine = true,
      -- highlightColor = { link = "Comment" },
      -- hints = {
      --      Caret = { text = "^", prio = 2 },
      --      Dollar = { text = "$", prio = 1 },
      --      MatchingPair = { text = "%", prio = 5 },
      --      Zero = { text = "0", prio = 1 },
      --      w = { text = "w", prio = 10 },
      --      b = { text = "b", prio = 9 },
      --      e = { text = "e", prio = 8 },
      --      W = { text = "W", prio = 7 },
      --      B = { text = "B", prio = 6 },
      --      E = { text = "E", prio = 5 },
      -- },
      -- gutterHints = {
      --     G = { text = "G", prio = 10 },
      --     gg = { text = "gg", prio = 9 },
      --     PrevParagraph = { text = "{", prio = 8 },
      --     NextParagraph = { text = "}", prio = 8 },
      -- },
    },
  },
}
