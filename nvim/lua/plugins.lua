local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.notify(vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }))
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- common utils
  {
    'nvim-lua/plenary.nvim',
    version = '*',
    lazy = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    version = '*',
    lazy = false,
    config = function()
      require('plugins_config.mason-lspconfig')
    end,
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = function()
          require('plugins_config.mason')
        end,
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    version = '*',
    lazy = false,
    dependencies = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-context',
    },
    config = function()
      require('plugins_config.treesitter')
    end,
    build = ':TSUpdate',
  },

  -- theme
  {
    'rose-pine/neovim',
    version = '*',
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    config = function()
      require('plugins_config.rose-pine')
    end,
  },

  -- ui
  {
    'nvim-lualine/lualine.nvim',
    version = '*',
    event = 'BufWinEnter',
    config = function()
      require('plugins_config.lualine')
    end,
  },
  {
    'folke/which-key.nvim',
    version = '*',
    lazy = false,
    priority = 900,
    config = function()
      require('plugins_config.which-key')
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    version = '*',
    event = 'BufWinEnter',
    config = function()
      require('plugins_config.gitsigns')
    end,
  },
  {
    'stevearc/oil.nvim',
    version = '*',
    opts = {},
    config = function()
      require('plugins_config.oil')
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    lazy = false,
    config = function()
      require('plugins_config.telescope')
    end,
  },
  {
    'NeogitOrg/neogit',
    config = true,
  },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('plugins_config.mini-indentscope')
    end,
  },
  {
    'ggandor/leap.nvim',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('plugins_config.leap')
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    lazy = false,
    init = function()
      -- powershell on windows
      if vim.loop.os_uname().sysname == 'Windows_NT' then
        local powershell_options = {
          shell = vim.fn.executable('pwsh') and 'pwsh' or 'powershell',
          shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
          shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
          shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
          shellquote = '',
          shellxquote = '',
        }

        for option, value in pairs(powershell_options) do
          vim.opt[option] = value
        end
      end
    end,
    config = function()
      require('plugins_config.toggleterm')
    end,
  },
  {
    'Bekaboo/deadcolumn.nvim',
    version = '*',
  },

  -- autocompletion
  {
    'github/copilot.vim',
    lazy = false,
    priority = 51,
  },
  {
    'hrsh7th/nvim-cmp',
    version = '*',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '*',
        dependencies = {
          'rafamadriz/friendly-snippets',
        },
        config = function()
          require('plugins_config.luasnip')
        end,
      },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-path' },
    },
    config = function()
      require('plugins_config.nvim-cmp')
    end,
  },
  {
    'numToStr/Comment.nvim',
    version = '*',
    event = 'BufWinEnter',
    config = function()
      require('plugins_config.comment')
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('plugins_config.surround')
    end,
  },
  {
    'danymat/neogen',
    version = '*',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins_config.neogen')
    end,
  },

  -- lsp
  {
    'neovim/nvim-lspconfig',
    event = 'VimEnter',
    config = function()
      require('plugins_config.lsp')
    end,
    dependencies = {
      {
        'nvimtools/none-ls.nvim',
        config = function()
          require('plugins_config.null-ls')
        end,
      },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
  {
    'luckasRanarison/clear-action.nvim',
    opts = {
      silent = false,
      signs = {
        enable = false,
      },
    },
  },
})