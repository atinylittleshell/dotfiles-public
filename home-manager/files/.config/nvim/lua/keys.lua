local wk = require('which-key')
local telescope_builtin = require('telescope.builtin')

-- make 'p' no longer update register
vim.cmd([[
  xnoremap <expr> p 'pgv"'.v:register.'y'
  nnoremap r <Nop>
]])

wk.add({
  mode = 'n',
  { '<C-a>', 'ggVG', desc = 'Select All' },
  { '<Esc>', ':w<CR>', desc = 'Save' },
  { 'r', require('substitute').operator, desc = 'Substitute' },
  -- grug-far
  {
    '<leader>r',
    ':GrugFar<CR>',
    desc = 'Search and Replace',
  },
  -- neogen
  {
    '<leader>d',
    function()
      require('neogen').generate({})
    end,
    desc = 'Generate Docs',
  },
  -- telescope
  {
    '<leader>f',
    function()
      telescope_builtin.find_files()
    end,
    desc = 'Find Files',
  },
  {
    '<leader>s',
    function()
      telescope_builtin.live_grep()
    end,
    desc = 'Grep',
  },
  {
    '<leader>b',
    function()
      telescope_builtin.buffers()
    end,
    desc = 'Grep',
  },
  {
    '<leader>e',
    ':Oil<CR>',
    desc = 'File Browser',
  },
  {
    '<leader>n',
    function()
      Snacks.notifier.show_history()
    end,
    desc = 'Notification history',
  },
  -- buffer
  {
    '<leader>x',
    function()
      Snacks.bufdelete({
        wipe = true,
      })
    end,
    desc = 'Close Buffer',
  },
  {
    '<leader>q',
    function()
      Snacks.bufdelete({
        wipe = true,
      })
      vim.cmd('q')
    end,
    desc = 'Close Window',
  },
  -- git
  {
    '<leader>g',
    ':Neogit<CR>',
    desc = 'Git',
  },
  -- llm
  {
    '<leader>l',
    ':Gen<CR>',
    desc = 'LLM',
  },
  {
    '<leader>tv',
    ':vsplit | vertical resize 120 | term<CR>',
    desc = 'Terminal in vsplit',
  },
  {
    '<leader>ts',
    ':split | resize 20 | term<CR>',
    desc = 'Terminal in split',
  },
})

wk.add({
  mode = 'v',
  -- llm
  {
    '<leader>l',
    ':Gen<CR>',
    desc = 'LLM',
  },
})

wk.add({
  mode = 't',
  -- terminal
  { '<ESC>', '<C-\\><C-n>', desc = 'Exit Terminal Mode' },
})
