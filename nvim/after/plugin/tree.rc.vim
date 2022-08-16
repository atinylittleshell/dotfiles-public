lua << END

require('nvim-tree').setup {
  disable_netrw = true,
  open_on_setup = true,
  open_on_setup_file = true,
  sort_by = 'case_sensitive'
}

END

nnoremap <Tab> :NvimTreeFindFile<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
