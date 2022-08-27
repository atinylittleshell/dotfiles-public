return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter.configs")

    ts.setup {
      highlight = {
        enable = true,
        disable = {},
      },
      indent = {
        enable = true,
        disable = {},
      },
      auto_install = true,
      ensure_installed = {
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "markdown",
        "graphql",
        "php",
        "json",
        "yaml",
        "css",
        "html",
        "lua",
        "vim"
      },
      autotag = {
        enable = true,
      },
    }

    require "nvim-treesitter.install".compilers = { "cl", "gcc" }

    require("treesitter-context").setup()
  end
}
