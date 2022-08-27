return {
  "glepnir/lspsaga.nvim",
  branch = "main",
  config = function()
    local saga = require("lspsaga")
    saga.init_lsp_saga {}
  end
}
