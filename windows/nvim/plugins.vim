let s:dir = expand('<sfile>:p:h')

call plug#begin(s:dir .. '\plugged')

" common libraries
Plug 'nvim-lua/plenary.nvim'

" ui

" lsp

" editing
Plug 'windwp/nvim-autopairs'
Plug 'editorconfig/editorconfig-vim'

call plug#end()