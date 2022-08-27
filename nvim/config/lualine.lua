return {
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true },
  config = function()
    require("lualine").setup {
      options = {
        theme = "catppuccin",
        icons_enabled = false,
        component_separators = "",
        section_separators = "",
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "diagnostics" },
          lualine_x = { "encoding", "fileformat" },
          lualine_y = { "filetype" },
          lualine_z = { "location" }
        }
      }
    }
  end
}
