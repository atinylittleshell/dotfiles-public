vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  -- common utils
  use({
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nvim-lua/plenary.nvim',
  })
  use({
    'williamboman/mason.nvim',
    config = function()
      require('plugins_config.mason')
    end,
    requires = {
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require('plugins_config.mason-lspconfig')
        end,
        after = 'mason.nvim',
      },
    },
  })

  -- theme
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require('plugins_config.rose-pine')
    end,
  })

  -- ui
  use({
    'xiyaowong/nvim-transparent',
    config = function()
      require('plugins_config.transparent')
    end,
    after = 'rose-pine',
  })
  use({
    'folke/noice.nvim',
    event = 'VimEnter',
    config = function()
      require('plugins_config.noice')
    end,
    requires = {
      'MunifTanjim/nui.nvim',
    },
    after = 'rose-pine',
  })
  use({
    'akinsho/bufferline.nvim',
    config = function()
      require('plugins_config.bufferline')
    end,
    after = 'rose-pine',
  })
  use({
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins_config.lualine')
    end,
    after = 'rose-pine',
  })
  use({
    'folke/which-key.nvim',
    config = function()
      require('plugins_config.which-key')
    end,
  })
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins_config.gitsigns')
    end,
    after = 'which-key.nvim',
    event = 'BufWinEnter',
  })
  use({
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins_config.telescope')
    end,
    after = 'which-key.nvim',
  })
  use({
    'ggandor/leap.nvim',
    config = function()
      require('plugins_config.leap')
    end,
  })
  use({
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('plugins_config.nvim-tree')
    end,
  })
  use({
    'akinsho/toggleterm.nvim',
    config = function()
      require('plugins_config.toggleterm')
    end,
  })

  -- autocompletion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      {
        'L3MON4D3/LuaSnip',
        requires = {
          'rafamadriz/friendly-snippets',
        },
        config = function()
          require('plugins_config.luasnip')
        end,
      },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    },
    config = function()
      require('plugins_config.nvim-cmp')
    end,
    event = 'InsertEnter',
  })
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('plugins_config.comment')
    end,
  })
  use({
    'github/copilot.vim',
    'editorconfig/editorconfig-vim',
  })

  -- lsp
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins_config.lsp')
    end,
    requires = {
      {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        config = function()
          require('plugins_config.lspsaga')
        end,
        after = 'nvim-lspconfig',
      },
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('plugins_config.null-ls')
        end,
        after = 'nvim-lspconfig',
      },
    },
    event = 'BufWinEnter',
  })
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-context',
      {
        'windwp/nvim-autopairs',
        config = function()
          require('plugins_config.nvim-autopairs')
        end,
      },
    },
    config = function()
      require('plugins_config.treesitter')
    end,
    run = ':TSUpdate',
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
