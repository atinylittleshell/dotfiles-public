return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd.with {
          condition = function(utils)
            return utils.root_has_file ".prettierrc"
                or utils.root_has_file ".prettierrc.js"
                or utils.root_has_file ".prettierrc.json"
          end,
          prefer_local = "node_modules/.bin"
        },
        null_ls.builtins.formatting.eslint_d.with {
          condition = function(utils)
            return utils.root_has_file ".eslintrc"
                or utils.root_has_file ".eslintrc.js"
                or utils.root_has_file ".eslintrc.json"
          end,
          prefer_local = "node_modules/.bin"
        }
      }
    })
  end
}
