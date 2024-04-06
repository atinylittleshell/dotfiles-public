return {
  {
    'folke/neodev.nvim',
  },
  {
    'luckasRanarison/clear-action.nvim',
    opts = {
      silent = false,
      signs = {
        enable = false,
      },
      mappings = {
        code_action = 'ga',
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
    config = function()
      require('neodev').setup()

      local nvim_lsp = require('lspconfig')
      local wk = require('which-key')

      local on_attach = function(client, bufnr)
        -- mappings
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
              '<cmd>Telescope lsp_definitions<cr>',
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
                vim.diagnostic.open_float({ scope = 'line' })
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
          client.name == nil
          or client.name == 'html'
          or client.name == 'jsonls'
          or client.name == 'kotlin_language_server'
          or client.name == 'lua_ls'
          or client.name == 'tailwindcss'
          or client.name == 'tsserver'
          or client.name == 'typescript-tools'
          or client.name == 'vtsls'
        then
          client.server_capabilities.documentFormattingProvider = false
        end
      end

      -- standard lsp setup
      for _, lsp in ipairs({
        'dockerls',
        'eslint',
        'gopls',
        'graphql',
        'html',
        'kotlin_language_server',
        'lemminx',
        'lua_ls',
        'prismals',
        'pyright',
        'rust_analyzer',
        'svelte',
        'tailwindcss',
        'taplo',
        'templ',
        'vtsls',
        'yamlls',
      }) do
        nvim_lsp[lsp].setup({
          on_attach = on_attach,
        })
      end

      -- custom lsp setup
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

      nvim_lsp.htmx.setup({
        on_attach = on_attach,
        filetypes = { 'html', 'typescriptreact', 'javascriptreact' },
      })

      nvim_lsp.jsonls.setup({
        on_attach = on_attach,
        settings = {
          json = {
            validate = { enable = true },
          },
        },
      })

      nvim_lsp.java_language_server.setup({
        on_attach = on_attach,
        cmd = {
          vim.fn.stdpath('data') .. '/mason/bin/java-language-server',
        },
      })
    end,
  },
}
