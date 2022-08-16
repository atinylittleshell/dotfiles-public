require("mason").setup()

require("mason-lspconfig").setup({
	automatic_installation = true,
})

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

vim.api.nvim_create_augroup("formatting", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "formatting",
	callback = function()
		vim.lsp.buf.formatting_sync()
	end,
})

local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)

	if client.name == "tsserver" or client.name == "eslint" or client.name == "tailwindcss" then
		client.resolved_capabilities.document_formatting = false
	end
end

protocol.CompletionItemKind = {
	'', -- Text
	'', -- Method
	'', -- Function
	'', -- Constructor
	'', -- Field
	'', -- Variable
	'', -- Class
	'ﰮ', -- Interface
	'', -- Module
	'', -- Property
	'', -- Unit
	'', -- Value
	'', -- Enum
	'', -- Keyword
	'﬌', -- Snippet
	'', -- Color
	'', -- File
	'', -- Reference
	'', -- Folder
	'', -- EnumMember
	'', -- Constant
	'', -- Struct
	'', -- Event
	'ﬦ', -- Operator
	'', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.cssls.setup {
	on_attach = on_attach,
	filetypes = { "css", "scss", "less" },
	cmd = { "vscode-css-language-server", "--stdio" },
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
	filetypes = { "html" },
	cmd = { "vscode-html-language-server", "--stdio" },
	capabilities = capabilities
}

nvim_lsp.eslint.setup {
	on_attach = on_attach,
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx",
		"vue" },
	cmd = { "vscode-eslint-language-server", "--stdio" },
	capabilities = capabilities
}

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
	on_attach = on_attach,
	filetypes = { "html", "css", "postcss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	cmd = { "tailwindcss-language-server", "--stdio" },
	capabilities = capabilities
}

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
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
}
