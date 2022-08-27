return {
  "akinsho/bufferline.nvim",
  tag = "v2.*",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("bufferline").setup {
      options = {
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false
      }
    }
  end
}
