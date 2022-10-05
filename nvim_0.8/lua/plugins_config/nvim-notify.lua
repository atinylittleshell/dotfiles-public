local notify = require('notify')
vim.notify = notify
notify.setup {
  stages = 'fade',
  timeout = 3000,
  render = 'default'
}
