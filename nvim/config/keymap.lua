vim.g.mapleader = " "

-- telescope
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local fb_actions = telescope.extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local function noremap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- telescope
vim.keymap.set('n', '<leader>f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', '<leader>r', function()
  builtin.live_grep()
end)
vim.keymap.set("n", "<leader>e", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir()
  })
end)

-- buffer switching
noremap("n", "<Tab>", ":bnext<CR>")
noremap("n", "<S-Tab>", ":bprev<CR>")
noremap("n", "<leader>x", ":bd<CR>")

-- increment/decrement
noremap("n", "+", "<C-a>")
noremap("n", "-", "<C-x>")

-- select all
noremap("n", "<C-a>", "gg<S-v>G")

-- terminal
noremap('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>')
noremap('t', '<leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
