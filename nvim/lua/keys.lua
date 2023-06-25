local wk = require('which-key')
local telescope_builtin = require('telescope.builtin')

-- make 'p' no longer update register
vim.cmd([[
  xnoremap <expr> p 'pgv"'.v:register.'y'
]])

-- n mode with no prefix
wk.register({
  -- buffer
  ['<Tab>'] = {
    ':bnext<CR>',
    'Next Buffer',
  },
  ['<S-Tab>'] = {
    ':bprevious<CR>',
    'Previous Buffer',
  },
  -- increment/decrement
  ['+'] = {
    '<C-a>',
    'Increment',
  },
  ['-'] = {
    '<C-x>',
    'Increment',
  },
  -- selection
  ['<C-a>'] = {
    'ggVG',
    'Select All',
  },
})

-- n mode with leader prefix
wk.register({
  -- telescope
  f = {
    function()
      telescope_builtin.find_files()
    end,
    'Find Files',
  },
  s = {
    function()
      telescope_builtin.live_grep()
    end,
    'Grep',
  },
  e = {
    ':Oil<CR>',
    'File Browser',
  },
  -- buffer
  x = {
    ':bd<CR>',
    'Close Buffer',
  },
  -- terminal
  t = {
    '<CMD>exe v:count1 . "ToggleTerm"<CR>',
    'Open Terminal',
  },
}, {
  prefix = '<leader>',
  mode = 'n',
})

-- t mode with no prefix
wk.register({
  -- terminal
  ['<ESC>'] = {
    '<CMD>close<CR>',
    'Close Terminal',
  },
}, {
  mode = 't',
})
