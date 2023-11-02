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
          require("telescope.builtin").lsp_definitions({ reuse_win = true })
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
      a = {
        function()
          vim.lsp.buf.code_action()
        end,
        'Code Action',
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
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})
