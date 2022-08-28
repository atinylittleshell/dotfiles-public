return {
  'rose-pine/neovim',
  as = 'rose-pine',
  tag = 'v1.*',
  after = 'bufferline.nvim',
  config = function()
    require('rose-pine').setup({
      dark_variant = 'moon'
    })

    vim.cmd('colorscheme rose-pine')

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

    require('lualine').setup {
      options = {
        theme = 'rose-pine',
        icons_enabled = false,
        component_separators = '',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'encoding', 'fileformat' },
        lualine_y = { 'filetype' },
        lualine_z = { 'location' }
      }
    }
  end
}
