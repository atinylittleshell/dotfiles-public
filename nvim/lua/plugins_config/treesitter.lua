require('nvim-treesitter.install').compilers = { 'x86_64-w64-mingw32-clang', 'gcc' }

require('treesitter-context').setup()
require('nvim-ts-autotag').setup()

local ts = require('nvim-treesitter.configs')
ts.setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { 'c', 'yaml', 'python', 'html', 'css' },
  },
  autotag = {
    enable = true,
    enable_close_on_slash = false,
  },
  auto_install = true,
  ensure_installed = 'all',
  ignore_install = { 'luadoc' },
})
