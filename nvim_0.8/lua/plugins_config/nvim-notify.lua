local notify = require('notify')
local p = require('rose-pine.palette')

vim.notify = notify

notify.setup({
  background_colour = p.base,
  stages = 'fade',
  timeout = 3000,
  render = 'default',
})
