return {
  'rose-pine/neovim',
  as = 'rose-pine',
  tag = 'v1.*',
  config = function()
    require('rose-pine').setup({
      dark_variant = 'moon'
    })

    vim.cmd('colorscheme rose-pine')
  end
}
