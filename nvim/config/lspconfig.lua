return {
  "neovim/nvim-lspconfig",
  config = function()
    local nvim_lsp = require("lspconfig")

    vim.api.nvim_create_augroup("formatting", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "formatting",
      callback = function()
        vim.lsp.buf.formatting_sync()
      end,
    })

    local protocol = require("vim.lsp.protocol")

    local on_attach = function(client, bufnr)
      if client.name == "tsserver" or client.name == "eslint" or client.name == "tailwindcss" then
        client.resolved_capabilities.document_formatting = false
      end
    end

    protocol.CompletionItemKind = {
      "", -- Text
      "", -- Method
      "", -- Function
      "", -- Constructor
      "", -- Field
      "", -- Variable
      "", -- Class
      "ﰮ", -- Interface
      "", -- Module
      "", -- Property
      "", -- Unit
      "", -- Value
      "", -- Enum
      "", -- Keyword
      "﬌", -- Snippet
      "", -- Color
      "", -- File
      "", -- Reference
      "", -- Folder
      "", -- EnumMember
      "", -- Constant
      "", -- Struct
      "", -- Event
      "ﬦ", -- Operator
      "", -- TypeParameter
    }

    local capabilities = require("cmp_nvim_lsp").update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )

    nvim_lsp.cssls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore"
          }
        }
      }
    }

    nvim_lsp.html.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    nvim_lsp.jsonls.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    nvim_lsp.eslint.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    nvim_lsp.tsserver.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    nvim_lsp.tailwindcss.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    nvim_lsp.sumneko_lua.setup {
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
            library = vim.api.nvim_get_runtime_file("", true),
          }
        }
      }
    }
  end
}
