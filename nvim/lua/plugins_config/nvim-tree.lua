vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  open_on_setup = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    number = true,
    relativenumber = true,
    adaptive_size = true,
    width = 60,
    float = {
      enable = true,
      open_win_config = {
        border = 'double',
      },
    },
    mappings = {
      list = {
        { key = '<ESC>', cb = require('nvim-tree.config').nvim_tree_callback('close') },
      },
    },
  },
})
