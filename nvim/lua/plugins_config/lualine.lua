require('lualine').setup({
  options = {
    theme = 'rose-pine',
    globalstatus = true,
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
    lualine_z = {},
  },
  winbar = {
    lualine_a = { 'filename' },
    lualine_b = {
      function()
        return require('do').view('active')
      end
    },
    lualine_c = {},
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
