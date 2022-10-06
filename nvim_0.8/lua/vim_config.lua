local cmd = vim.cmd
local o = vim.opt
local g = vim.g
local indent = 2

cmd([[
	filetype plugin indent on
]])

-- app behaviors
o.backup = false
o.swapfile = false
o.writebackup = false
o.termguicolors = true
o.title = false
o.fileencodings = 'utf-8'
o.clipboard = 'unnamedplus'
o.undofile = true
o.mouse = ''
g.mapleader = ' '

-- indention
o.autoindent = true
o.expandtab = true
o.shiftwidth = indent
o.smartindent = true
o.softtabstop = indent
o.tabstop = indent

-- search
o.hlsearch = false
o.ignorecase = true
o.smartcase = true
o.wildignore = o.wildignore + { '*/node_modules/*', '*/.git/*', '*/vendor/*' }
o.wildmenu = true

-- ui
o.ls = 0
o.cmdheight = 0
o.signcolumn = 'yes'
o.splitbelow = true
o.splitright = true
o.wrap = false

-- show relative number
o.number = true
o.relativenumber = true

-- performance
o.redrawtime = 1500
o.timeoutlen = 250
o.ttimeoutlen = 10
o.updatetime = 100

-- disable some unnecessary highlighting
o.cursorline = false
g.loaded_matchparen = 0

-- format on save
vim.api.nvim_create_augroup('formatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'formatting',
  callback = function()
    vim.lsp.buf.format()
    vim.notify('File formatted on save.')
  end,
})
