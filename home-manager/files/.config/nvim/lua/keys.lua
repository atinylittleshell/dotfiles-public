local wk = require('which-key')
local telescope_builtin = require('telescope.builtin')

-- make 'p' no longer update register
vim.cmd([[
  xnoremap <expr> p 'pgv"'.v:register.'y'
  nnoremap r <Nop>
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
  -- substitute
  ['r'] = {
    require('substitute').operator,
    'Substitute',
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
    ':Bdelete<CR>',
    'Close Buffer',
  },
  q = {
    ':q<CR>',
    'Close Window',
  },
  -- git
  g = {
    ':Neogit<CR>',
    'Git',
  },
  -- llm
  l = {
    ':GpChatToggle popup<CR>',
    'LLM',
  },
  t = {
    v = {
      ':vsplit | vertical resize 120 | term<CR>',
      'Terminal in vsplit',
    },
    s = {
      ':split | resize 20 | term<CR>',
      'Terminal in split',
    },
  },
}, {
  prefix = '<leader>',
  mode = 'n',
})

-- v mode with leader prefix
wk.register({
  -- llm
  l = {
    ':GpChatToggle popup<CR>',
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
