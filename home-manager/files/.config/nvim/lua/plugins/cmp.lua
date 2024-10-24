return {
  {
    'saghen/blink.cmp',
    version = 'v0.*',
    lazy = false,
    opts = {
      highlight = {
        use_nvim_cmp_as_default = true,
      },
    },
  },
  {
    'danymat/neogen',
    version = '*',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {
      enabled = true,
    },
  },
}
