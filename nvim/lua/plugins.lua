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
    lazy = true,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require('plugins_config.mason')
    end,
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require('plugins_config.mason-lspconfig')
        end,
      },
    },
  },

  -- theme
  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    config = function()
      require('plugins_config.rose-pine')
    end,
  },

  -- ui
  {
    'akinsho/bufferline.nvim',
    event = 'BufWinEnter',
    config = function()
      require('plugins_config.bufferline')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'BufWinEnter',
    config = function()
      require('plugins_config.lualine')
    end,
  },
  {
    'folke/which-key.nvim',
    lazy = false,
    priority = 900,
    config = function()
      require('plugins_config.which-key')
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufWinEnter',
    config = function()
      require('plugins_config.gitsigns')
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    lazy = false,
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('plugins_config.telescope')
    end,
  },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    event = 'BufWinEnter',
    config = function()
      require('plugins_config.mini-indentscope')
    end,
  },
  {
    'ggandor/leap.nvim',
    event = 'VimEnter',
    config = function()
      require('plugins_config.leap')
    end,
  },
  {
    'akinsho/toggleterm.nvim',
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
  { 'Bekaboo/deadcolumn.nvim' },

  -- autocompletion
  {
    'github/copilot.vim',
    lazy = false,
    priority = 51,
  },
  {
    'editorconfig/editorconfig-vim',
    event = 'VimEnter',
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
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
    event = 'BufWinEnter',
    config = function()
      require('plugins_config.comment')
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
        'glepnir/lspsaga.nvim',
        branch = 'main',
        event = 'BufRead',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        config = function()
          require('plugins_config.lspsaga')
        end,
      },
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('plugins_config.null-ls')
        end,
      },
      { 'b0o/schemastore.nvim' },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
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
})
