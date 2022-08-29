return {
  "Maan2003/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = {
        only_current_line = true
      },
      underline = true,
      update_in_insert = false
    })
  end
}
