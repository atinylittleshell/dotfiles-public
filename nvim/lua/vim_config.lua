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
    vim.lsp.buf.format({ timeout_ms = 10000 })
    vim.notify('File formatted on save.')
  end,
})

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
