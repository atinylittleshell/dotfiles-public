return {
  {
    'lewis6991/gitsigns.nvim',
    version = '*',
    event = 'BufWinEnter',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'right_align',
          delay = 3000,
        },
      })
    end,
  },
  {
    'NeogitOrg/neogit',
    config = true,
  },
}
