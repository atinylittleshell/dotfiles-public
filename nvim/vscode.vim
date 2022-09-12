" app behaviors
set clipboard=unnamedplus

" editing
set shiftwidth=2
set tabstop=2

" key binds
xnoremap <expr> p 'pgv"'.v:register.'y'
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <C-a> ggVG

nnoremap ga <cmd>call VSCodeNotify('editor.action.quickFix')<cr>
nnoremap <space>e <cmd>call VSCodeNotify('workbench.view.explorer')<cr>
nnoremap <space>f <cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>
nnoremap <space>r <cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>
nnoremap <space>t <cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<cr>
nnoremap <space>x <cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
