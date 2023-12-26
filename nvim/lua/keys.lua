local wk = require('which-key')
local telescope_builtin = require('telescope.builtin')

-- make 'p' no longer update register
vim.cmd([[
  xnoremap <expr> p 'pgv"'.v:register.'y'
]])

-- n mode with no prefix
wk.register({
  -- selection
  ['<C-a>'] = {
    'ggVG',
    'Select All',
  },
  -- save
  ['<Esc>'] = {
    ':w<CR>',
    'Save',
  },
}, {
  mode = 'n',
})

-- n mode with leader prefix
wk.register({
  -- neogen
  d = {
    function()
      require('neogen').generate({})
    end,
    'Generate Docs',
  },
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
  b = {
    function()
      telescope_builtin.buffers()
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
  -- git
  g = {
    ':Neogit<CR>',
    'Git',
  },
  -- llm
  l = {
    ':Gen<CR>',
    'LLM',
  },
}, {
  prefix = '<leader>',
  mode = 'n',
})

-- v mode with leader prefix
wk.register({
  -- llm
  l = {
    ':Gen<CR>',
    'LLM',
  },
}, {
  prefix = '<leader>',
  mode = 'v',
})

-- t mode with no prefix
wk.register({
  -- terminal
  ['<ESC>'] = {
    '<C-\\><C-n>',
    'Exit Terminal Mode',
  },
}, {
  mode = 't',
})
