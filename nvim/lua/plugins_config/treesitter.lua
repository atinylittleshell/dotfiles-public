local ts = require('nvim-treesitter.configs')
ts.setup({
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = false,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  auto_install = true,
  ensure_installed = {
    'bash',
    'dockerfile',
    'javascript',
    'jsdoc',
    'typescript',
    'tsx',
    'html',
    'css',
    'graphql',
    'json',
    'markdown',
    'markdown_inline',
    'php',
    'prisma',
    'python',
    'yaml',
    'lua',
    'vim',
  },
})

require('nvim-treesitter.install').compilers = { 'x86_64-w64-mingw32-clang', 'gcc' }

require('treesitter-context').setup()
require('nvim-autopairs').setup()
require('nvim-ts-autotag').setup()
