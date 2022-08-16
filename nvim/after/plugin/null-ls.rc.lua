local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier.with {
			condition = function(utils)
				return utils.root_has_file ".prettierrc"
					or utils.root_has_file ".prettierrc.js"
					or utils.root_has_file ".prettierrc.json"
			end,
			prefer_local = "node_modules/.bin"
		},
		null_ls.builtins.formatting.eslint.with {
			condition = function(utils)
				return utils.root_has_file ".eslintrc"
					or utils.root_has_file ".eslintrc.js"
					or utils.root_has_file ".eslintrc.json"
			end,
			prefer_local = "node_modules/.bin"
		}
	}
})
