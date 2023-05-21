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
o.fileformat = 'unix'
o.fileformats = 'unix,dos,mac'
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
o.cmdheight = 1
o.signcolumn = 'yes'
o.splitbelow = true
o.splitright = true
o.wrap = false
o.scrolloff = 16
o.textwidth = 120
o.colorcolumn = '+0'

-- show relative number
o.number = true
o.relativenumber = true

-- performance
o.redrawtime = 1500
o.timeoutlen = 250
o.ttimeoutlen = 10
o.updatetime = 100

-- disable some unnecessary highlighting
g.loaded_matchparen = 0

-- disable copilot in telescope
g.copilot_filetypes = {
  TelescopePrompt = false,
}

-- format on save
vim.api.nvim_create_augroup('formatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'formatting',
  callback = function()
    vim.lsp.buf.format({ timeout_ms = 10000 })
  end,
})

-- diagnostic
vim.diagnostic.config({
  virtual_text = false,
})

-- WSL clipboard
if os.getenv('WSL_DISTRO_NAME') then
  o.clipboard = ''
end
