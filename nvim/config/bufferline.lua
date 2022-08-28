return {
  'akinsho/bufferline.nvim',
  tag = 'v2.*',
  requires = 'kyazdani42/nvim-web-devicons',
  event = 'ColorScheme',
  config = function()
    local highlights = require('rose-pine.plugins.bufferline')
    require('bufferline').setup {
      highlights = highlights,
      options = {
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false
      }
    }
  end
}
