return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    dependencies = {
      { 'windwp/nvim-ts-autotag' },
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
      { 'nvim-treesitter/nvim-treesitter-context' },
    },
    config = function()
      require('nvim-treesitter.install').prefer_git = true
      require('nvim-treesitter.install').compilers = { 'x86_64-w64-mingw32-clang', 'gcc' }

      require('treesitter-context').setup()
      require('nvim-ts-autotag').setup()

      local treesitter = require('nvim-treesitter.configs')
      treesitter.setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = false,
          disable = { 'c', 'yaml', 'python', 'html', 'css' },
        },
        autotag = {
          enable = true,
          enable_close_on_slash = false,
        },
        auto_install = true,
        ensure_installed = 'all',
        sync_install = false,
        ignore_install = { 'luadoc' },
        modules = {},
      })
    end,
    build = ':TSUpdate',
  },
}
