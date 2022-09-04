----=== Windows specific setup ===----
if (vim.loop.os_uname().sysname == "Windows NT") then
  -- Enable powershell as your default shell
  vim.opt.shell = "pwsh.exe -NoLogo"
  vim.opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.cmd [[
      let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
      let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
      set shellquote= shellxquote=
    ]]
end

----=== General Options ===----
lvim.log.level = "warn"
lvim.colorscheme = "rose-pine"
lvim.format_on_save = true
lvim.use_icons = false
vim.opt.mouse = ''
vim.opt.clipboard = 'unnamedplus'

-- disable some annoying highlights
vim.opt.cursorline = false
vim.g.loaded_matchparen = 0

----=== Key Mappings ===----
lvim.leader = "space"

-- files
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- buffer switching
lvim.keys.normal_mode["<tab>"] = ":bnext<cr>"
lvim.keys.normal_mode["<S-tab>"] = ":bprev<cr>"
lvim.keys.normal_mode["<leader>x"] = ":bd<cr>"

-- select all
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"

-- terminal
lvim.keys.normal_mode["<leader>t"] = "<cmd>lua require(\"FTerm\").toggle()<CR>"
lvim.keys.term_mode["<esc>"] = "<C-\\><C-n><cmd>lua require(\"FTerm\").toggle()<CR>"

-- telescope
local ts = require("telescope")
local ts_builtin = require("telescope.builtin")
local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "file_browser")
end
lvim.builtin.telescope.extensions = {
  file_browser = {
    hijack_netrw = true,
    initial_mode = "normal",
    hidden = true,
    grouped = true,
    respect_gitignore = true,
    layout_config = { height = 40 }
  }
}
lvim.keys.normal_mode["<leader>r"] =
function()
  ts_builtin.live_grep()
end
lvim.keys.normal_mode["<leader>e"] =
function()
  ts.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir()
  })
end

----=== Builtin Plugins ===----
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = false
lvim.builtin.nvimtree.active = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "lua",
  "python",
  "rust",
  "java",
  "yaml",
  "markdown",
  "javascript",
  "json",
  "jsdoc",
  "typescript",
  "tsx",
  "html",
  "css",
}
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

----=== LSP Settings ===----
lvim.lsp.document_highlight = false

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
local null_ls = require "null-ls"
formatters.setup {
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

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

----=== Extra Plugins ===----
lvim.plugins = {
  {
    "rose-pine/neovim",
    as = "rose-pine",
    tag = "v1.*",
    config = function()
      require("rose-pine").setup({
        dark_variant = "moon"
      })

      vim.cmd "colorscheme rose-pine"
    end
  },
  {
    "numToStr/FTerm.nvim",
    config = function()
      require("FTerm").setup({
        border = "double"
      })
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim"
  },
  {
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
}
