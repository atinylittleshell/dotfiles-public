return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = telescope.extensions.file_browser.actions

    telescope.setup {
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close
          },
        },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          initial_mode = "normal",
          hidden = true,
          grouped = true,
          respect_gitignore = true,
          layout_config = { height = 40 },
          mappings = {
            ["n"] = {
              ["a"] = fb_actions.create
            }
          }
        }
      },
    }

    telescope.load_extension("file_browser")
  end
}


