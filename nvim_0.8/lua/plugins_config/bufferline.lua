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
      italic = false,
      bold = true
    }
  },
  options = {
    always_show_bufferline = true,
    modified_icon = '●',
    left_trunc_marker = '',
    right_trunc_marker = '',
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false
  }
}
