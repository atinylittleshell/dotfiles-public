return {
  "catppuccin/nvim",
  as = "catppuccin",
  config = function()
    vim.g.catppuccin_flavour = "frappe" 
    require("catppuccin").setup()
    vim.cmd [[colorscheme catppuccin]]
  end
}
