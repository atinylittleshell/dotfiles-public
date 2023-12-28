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
g.fixeol = true
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

-- highlighting
o.cursorline = true
g.loaded_matchparen = 0

-- file types for copilot
g.copilot_filetypes = {
  ['*'] = false,
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
  json = true,
  html = true,
  css = true,
  lua = true,
  yaml = true,
  markdown = true,
  text = true,
  kotlin = true,
}

-- diagnostic
vim.diagnostic.config({
  virtual_text = false,
})

-- WSL clipboard
if os.getenv('WSL_DISTRO_NAME') then
  o.clipboard = ''
end

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
