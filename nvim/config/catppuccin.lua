return {
  "catppuccin/nvim",
  as = "catppuccin",
  config = function()
    vim.g.catppuccin_flavour = "frappe"
    require("catppuccin").setup({
      integrations = {
        treesitter = true,
        cmp = true,
        lsp_saga = true,
        telescope = true,
        bufferline = {
          enabled = true
        }
      }
    })
    vim.cmd [[colorscheme catppuccin]]
  end
}
