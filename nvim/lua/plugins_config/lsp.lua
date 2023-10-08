local nvim_lsp = require('lspconfig')
local wk = require('which-key')

require('lspconfig.configs').vtsls = require('vtsls').lspconfig

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  wk.register({
    K = {
      '<CMD>Lspsaga hover_doc ++quiet<CR>',
      'Hover',
    },
    g = {
      name = 'lspsaga',
      d = {
        '<CMD>Lspsaga finder<CR>',
        'Go to Definition',
      },
      p = {
        '<CMD>Lspsaga peek_definition<CR>',
        'Peek Definition',
      },
      n = {
        '<CMD>Lspsaga rename<CR>',
        'Rename',
      },
      s = {
        '<CMD>Lspsaga signature_help<CR>',
        'Signature Help',
      },
      l = {
        '<CMD>Lspsaga show_line_diagnostics<CR>',
        'Show Line Diagnostics',
      },
      c = {
        '<CMD>Lspsaga show_cursor_diagnostics<CR>',
        'Show Cursor Diagnostics',
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

  if client.name == 'eslint' then
    client.server_capabilities.documentFormattingProvider = true
  end

  -- formatting for the following languages are covered by null-ls
  if
    client.name == 'vtsls'
    or client.name == 'jsonls'
    or client.name == 'tailwindcss'
    or client.name == 'rust_analyzer'
    or client.name == 'lua_ls'
  then
    client.server_capabilities.documentFormattingProvider = false
  end
end

nvim_lsp.cssls.setup({
  on_attach = on_attach,
  settings = {
    css = {
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
})

nvim_lsp.html.setup({
  on_attach = on_attach,
})

nvim_lsp.jsonls.setup({
  on_attach = on_attach,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

nvim_lsp.eslint.setup({
  on_attach = on_attach,
})

nvim_lsp.vtsls.setup({
  on_attach = on_attach,
})

nvim_lsp.tailwindcss.setup({
  on_attach = on_attach,
})

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
})

nvim_lsp.pyright.setup({
  on_attach = on_attach,
})

nvim_lsp.prismals.setup({
  on_attach = on_attach,
})

nvim_lsp.lua_ls.setup({
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
        checkThirdParty = false,
      },
    },
  },
})
