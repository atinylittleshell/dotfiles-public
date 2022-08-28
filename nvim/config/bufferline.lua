return {
  'akinsho/bufferline.nvim',
  tag = 'v2.*',
  after = 'rose-pine',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    local p = require('rose-pine.palette')
    require('bufferline').setup {
      highlights = {
        buffer_visible = {
          fg = p.subtle,
          bg = p.base
        },
        buffer_selected = {
          fg = p.text,
          bg = p.surface,
          bold = true
        }
      },
      options = {
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false
      }
    }
  end
}
