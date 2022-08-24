local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. packer_path)
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
  "BufWritePost",
  { command = "source <afile> | PackerCompile", group = packer_group, pattern = "init.lua" }
)

require("packer").startup(function(use)
  -- common libraries
  use "wbthomason/packer.nvim"
  use 'nvim-lua/plenary.nvim'
  use 'williamboman/mason.nvim'

  -- ui
  use { 
    "catppuccin/nvim", 
    as = "catppuccin",
    config = function() 
      vim.g.catppuccin_flavour = "frappe" 
      require("catppuccin").setup()
      vim.cmd [[colorscheme catppuccin]]
    end
  }

  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    config = function() vim.g.mkdp_auto_start = 1 end
  })
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    "akinsho/toggleterm.nvim", 
    tag = 'v2.*', 
    config = function() require("toggleterm").setup() end
  }

  -- lsp
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'Maan2003/lsp_lines.nvim'

  -- editing
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'editorconfig/editorconfig-vim'
end)

-- options
vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.title = true
vim.o.ignorecase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.si = true
vim.o.signcolumn = "yes"

-- keymap
vim.g.mapleader = " "
