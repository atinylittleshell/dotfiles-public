require('gitsigns').setup {
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align',
    delay = 1000
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local wk = require('which-key')

    wk.register({
      h = {
        name = 'Hunk',
        p = { gs.preview_hunk, 'preview' },
        r = { gs.reset_hunk, 'Reset' },
        R = { gs.reset_buffer, 'Reset Buffer' },
        s = { gs.stage_hunk, 'Stage' },
        u = { gs.undo_stage_hunk, 'Undo Stage' },
        n = { gs.select_hunk, 'Select' },
        N = { gs.select_prev_hunk, 'Select Prev' },
        d = { gs.diffthis, 'Diff' },
      }
    }, {
      buffer = bufnr,
      prefix = '<leader>',
    })
  end
}
