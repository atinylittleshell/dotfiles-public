return {
  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        dark_variant = 'moon',
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        styles = {
          italic = false,
        },
      })

      vim.cmd('colorscheme rose-pine')

      -- my own preferences
      vim.api.nvim_set_hl(0, '@type.qualifier.typescript', { link = 'Keyword' })
      vim.api.nvim_set_hl(0, '@type.qualifier.tsx', { link = 'Keyword' })
    end,
  },
}
