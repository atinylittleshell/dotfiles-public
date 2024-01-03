local nvim_lsp = require('lspconfig')
local wk = require('which-key')

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  wk.register({
    K = {
      function()
        vim.lsp.buf.hover()
      end,
      'Hover',
    },
    g = {
      name = 'lsp',
      d = {
        function()
          require('telescope.builtin').lsp_definitions({ reuse_win = true })
        end,
        'Go to Definition',
      },
      n = {
        function()
          vim.lsp.buf.rename()
        end,
        'Rename',
      },
      s = {
        function()
          vim.lsp.buf.signature_help()
        end,
        'Signature Help',
      },
      l = {
        function()
          vim.diagnostic.open_float()
        end,
        'Show Line Diagnostics',
      },
    },
    ['[g'] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      'Jump to previous diagnostic',
    },
    [']g'] = {
      function()
        vim.diagnostic.goto_next()
      end,
      'Jump to next diagnostic',
    },
  }, {
    buffer = bufnr,
  })

  if client.name == 'eslint' then
    client.server_capabilities.documentFormattingProvider = true
  end

  -- formatting for the following languages are covered by conform
  if
    client.name == 'tsserver'
    or client.name == 'jsonls'
    or client.name == 'vtsls'
    or client.name == 'typescript-tools'
    or client.name == 'tailwindcss'
    or client.name == 'rust_analyzer'
    or client.name == 'lua_ls'
    or client.name == 'kotlin_language_server'
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

nvim_lsp.svelte.setup({
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

nvim_lsp.graphql.setup({
  on_attach = on_attach,
})

nvim_lsp.lemminx.setup({
  on_attach = on_attach,
})

nvim_lsp.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
})

nvim_lsp.dockerls.setup({
  on_attach = on_attach,
})

nvim_lsp.yamlls.setup({
  on_attach = on_attach,
})

nvim_lsp.kotlin_language_server.setup({
  on_attach = on_attach,
})

nvim_lsp.java_language_server.setup({
  on_attach = on_attach,
  cmd = {
    vim.fn.stdpath('data') .. '/mason/bin/java-language-server',
  },
})

nvim_lsp.gopls.setup({
  on_attach = on_attach,
})

nvim_lsp.templ.setup({
  on_attach = on_attach,
})
