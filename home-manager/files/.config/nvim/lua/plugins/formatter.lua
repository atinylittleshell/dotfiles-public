return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = function()
      return {
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'black' },
          javascript = { 'prettier' },
          javascriptreact = { 'prettier' },
          typescript = { 'prettier' },
          typescriptreact = { 'prettier' },
          json = { 'prettier' },
          css = { 'prettier' },
          html = { 'prettier' },
          yaml = { 'prettier' },
          markdown = { 'prettier' },
          graphql = { 'prettier' },
          kotlin = { 'ktfmt' },
        },
        format_on_save = { timeout_ms = 10000, lsp_fallback = 'always' },
        formatters = {
          ktfmt = {
            command = 'java',
            args = {
              '-jar',
              '/usr/local/bin/ktfmt.jar',
              '--kotlinlang-style',
              '-',
            },
            stdin = true,
            cwd = require('conform.util').root_file({ '.git', 'build.gradle', '.editorconfig' }),
            require_cwd = true,
          },
        },
      }
    end,
  },
}
