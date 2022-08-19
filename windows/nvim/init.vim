syntax enable
set ignorecase

if exists('g:vscode')
else
endif

runtime ./keymap.vim
runtime ./plugins.vim