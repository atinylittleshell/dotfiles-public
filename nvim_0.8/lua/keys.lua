local wk = require('which-key')
local telescope = require('telescope')
local builtin = require('telescope.builtin')

local function buffer_dir()
  return vim.fn.expand('%:p:h')
end

-- make 'p' no longer update register
vim.cmd [[
  xnoremap <expr> p 'pgv"'.v:register.'y'
]]

-- n mode with no prefix
wk.register({
  -- buffer
  ['<Tab>'] = {
    ':bnext<CR>',
    'Next Buffer'
  },
  ['<S-Tab>'] = {
    ':bprevious<CR>',
    'Previous Buffer'
  },
  -- increment/decrement
  ['+'] = {
    '<C-a>',
    'Increment'
  },
  ['-'] = {
    '<C-x>',
    'Increment'
  },
  -- selection
  ['<C-a>'] = {
    'ggVG',
    'Select All'
  },
})

-- n mode with leader prefix
wk.register({
  -- telescope
  f = {
    function()
      builtin.find_files({
        no_ignore = false,
        hidden = true
      })
    end,
    'Find Files'
  },
  r = {
    function()
      builtin.live_grep()
    end,
    'Grep'
  },
  e = {
    function()
      telescope.extensions.file_browser.file_browser({
        path = '%:p:h',
        cwd = buffer_dir()
      })
    end,
    'File Browser'
  },
  -- buffer
  x = {
    ':bd<CR>',
    'Close Buffer'
  },
  -- terminal
  t = {
    '<CMD>lua require("FTerm").toggle()<CR>',
    'Open Terminal',
  },
}, {
  prefix = '<leader>',
  mode = 'n'
})

-- t mode with no prefix
wk.register({
  -- terminal
  ['<ESC>'] = {
    '<CMD>lua require("FTerm").toggle()<CR>',
    'Close Terminal',
  },
}, {
  mode = 't'
})
