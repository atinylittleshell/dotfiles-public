package.path = package.path .. ';' .. os.getenv('DOT_FILES_HOME') .. '/nvim/?.lua'

local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd(
  'BufWritePost',
  { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' }
)

-- vim options
vim.o.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.title = true
vim.o.ignorecase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.si = true
vim.o.signcolumn = 'yes'

require('packer').startup(function(use)
  -- common libraries
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use(require('config.mason'))

  -- ui
  use(require('config.bufferline'))
  use(require('config.lualine'))
  use(require('config.rose-pine'))
  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-web-devicons').setup() end
  }
  use(require('config.markdown-preview'))
  use(require('config.telescope'))
  use(require('config.telescope-file-browser'))
  use(require('config.fterm'))
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end
  }

  -- lsp
  use 'williamboman/mason-lspconfig.nvim'
  use(require('config.lspconfig'))
  use(require('config.lspsaga'))
  use(require('config.luasnip'))
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use(require('config.cmp'))
  use(require('config.null-ls'))
  use(require('config.lsp-lines'))

  -- editing
  use 'github/copilot.vim'
  use(require('config.treesitter'))
  use 'nvim-treesitter/nvim-treesitter-context'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }
  use 'editorconfig/editorconfig-vim'
end)

require('config.keymap')
