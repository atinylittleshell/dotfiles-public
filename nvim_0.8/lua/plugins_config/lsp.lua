local nvim_lsp = require('lspconfig')
local wk = require('which-key')

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  wk.register({
    K = {
      '<CMD>Lspsaga hover_doc<CR>',
      'Hover'
    },
    g = {
      name = 'lspsaga',
      d = {
        '<CMD>Lspsaga lsp_finder<CR>',
        'Go to Definition'
      },
      p = {
        '<CMD>Lspsaga peek_definition<CR>',
        'Peek Definition'
      },
      n = {
        '<CMD>Lspsaga rename<CR>',
        'Rename'
      },
      a = {
        '<CMD>Lspsaga code_action<CR>',
        'Code Action'
      },
      s = {
        '<CMD>Lspsaga signature_help<CR>',
        'Signature Help'
      },
      l = {
        '<CMD>Lspsaga show_line_diagnostics<CR>',
        'Show Line Diagnostics'
      },
      c = {
        '<CMD>Lspsaga show_cursor_diagnostics<CR>',
        'Show Cursor Diagnostics'
      },
    },
    ['[g'] = {
      '<cmd>Lspsaga diagnostic_jump_prev<CR>',
      'Jump to previous diagnostic',
    },
    [']g'] = {
      '<cmd>Lspsaga diagnostic_jump_next<CR>',
      'Jump to next diagnostic',
    },
  }, {
    buffer = bufnr,
  })

  -- formatting for the following languages are covered by null-ls
  if client.name == 'tsserver' or client.name == 'eslint' or client.name == 'tailwindcss' or
      client.name == 'rust_analyzer' then
    client.server_capabilities.documentFormattingProvider = false
  end
end

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      }
    }
  }
}
