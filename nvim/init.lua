----=====================----
----=== Windows Setup ===----
----=====================----

if (vim.loop.os_uname().sysname == 'Windows NT') then
  -- Enable powershell as your default shell
  vim.opt.shell = 'pwsh.exe -NoLogo'
  vim.opt.shellcmdflag =
  '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  vim.cmd [[
      let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
      let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
      set shellquote= shellxquote=
    ]]
end

----=====================----
----=== Util Functions ===---
----=====================----

local function buffer_dir()
  return vim.fn.expand('%:p:h')
end

----=======================----
----=== General Options ===----
----=======================----

-- app behaviors
vim.o.backup = false
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.title = false
vim.o.fileencodings = 'utf-8'
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = ''
vim.g.mapleader = ' '

-- editing
vim.o.ignorecase = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.undofile = true

-- ui
vim.o.cmdheight = 2
vim.o.signcolumn = 'yes'
vim.o.splitbelow = true
vim.o.splitright = true

-- show relative number
vim.o.number = true
vim.o.relativenumber = true

-- disable some unnecessary highlighting
vim.o.cursorline = false
vim.g.loaded_matchparen = 0

----===============----
----=== Plugins ===----
----===============----

local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- common libraries
Plug 'wbthomason/packer.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'williamboman/mason.nvim'

-- ui
Plug 'rose-pine/neovim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug('iamcco/markdown-preview.nvim', {
  ['do'] = function() vim.fn['mkdp#util#install']() end,
  ['for'] = { 'markdown', 'vim-plug' }
})
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'numToStr/FTerm.nvim'
Plug 'folke/which-key.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'lewis6991/gitsigns.nvim'

-- language related
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug('glepnir/lspsaga.nvim', {
  ['branch'] = 'main'
})
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug('nvim-treesitter/nvim-treesitter', {
  ['do'] = ':TSUpdate',
})
Plug 'nvim-treesitter/nvim-treesitter-context'

-- editing
Plug 'github/copilot.vim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'editorconfig/editorconfig-vim'

vim.call('plug#end')

require('mason').setup {
  ui = {
    keymaps = {
      toggle_package_expand = '<CR>',
      install_package = 'i',
      update_package = 'u',
      check_package_version = 'c',
      update_all_packages = 'U',
      check_outdated_packages = 'C',
      uninstall_package = 'X',
      cancel_installation = '<C-c>',
      apply_language_filter = '<C-f>',
    },
  },
}
require('mason-lspconfig').setup {
  automatic_installation = true
}

require('rose-pine').setup({
  dark_variant = 'moon'
})
vim.cmd('colorscheme rose-pine')

local p = require('rose-pine.palette')
require('bufferline').setup {
  highlights = {
    buffer_visible = {
      fg = p.subtle,
      bg = p.base
    },
    buffer_selected = {
      fg = p.text,
      bg = p.surface,
      italic = false,
      bold = true
    }
  },
  options = {
    always_show_bufferline = true,
    modified_icon = '●',
    left_trunc_marker = '',
    right_trunc_marker = '',
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false
  }
}

require('lualine').setup {
  options = {
    theme = 'rose-pine',
    icons_enabled = false,
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'diagnostics' },
    lualine_x = { 'encoding', 'fileformat' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' }
  }
}

vim.notify = require('notify')
require('notify').setup {
  stages = 'fade',
  timeout = 3000,
  render = 'default'
}

local wk = require('which-key')
wk.setup()

require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align',
    delay = 1000
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    wk.register({
      h = {
        name = 'Hunk',
        p = { gs.preview_hunk, 'preview' },
        r = { gs.reset_hunk, 'Reset' },
        R = { gs.reset_buffer, 'Reset Buffer' },
        s = { gs.stage_hunk, 'Stage' },
        u = { gs.undo_stage_hunk, 'Undo Stage' },
        n = { gs.select_hunk, 'Select' },
        N = { gs.select_prev_hunk, 'Select Prev' },
        d = { gs.diffthis, 'Diff' },
      }
    }, {
      buffer = bufnr,
      prefix = '<leader>',
    })
  end
}

-- markdown preview
vim.g.mkdp_auto_start = 1

-- telescope
local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      initial_mode = 'normal',
      hidden = true,
      grouped = true,
      respect_gitignore = true,
      layout_config = { height = 40 },
      mappings = {
        ['n'] = {
          ['a'] = fb_actions.create
        }
      }
    }
  },
}

telescope.load_extension('file_browser')

require('FTerm').setup({
  border = 'double'
})

-- lsp
local nvim_lsp = require('lspconfig')

vim.api.nvim_create_augroup('formatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'formatting',
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 5000)
    vim.notify('File formatted on save.')
  end,
})

local on_attach = function(client)
  if client.name == 'tsserver' or client.name == 'eslint' or client.name == 'tailwindcss' then
    client.resolved_capabilities.document_formatting = false
  end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    css = {
      lint = {
        unknownAtRules = 'ignore'
      }
    }
  }
}

nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      }
    }
  }
}

require('lspsaga').init_lsp_saga {
  code_action_keys = {
    quit = '<ESC>',
    exec = '<CR>'
  },
  definition_action_keys = {
    quit = '<ESC>',
    open = '<CR>'
  },
}

local cmp = require('cmp')
if (cmp ~= nil) then
  cmp.setup {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
    })
  }
end

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd.with {
      condition = function(utils)
        return utils.root_has_file '.prettierrc'
            or utils.root_has_file '.prettierrc.js'
            or utils.root_has_file '.prettierrc.json'
      end,
      prefer_local = 'node_modules/.bin'
    },
    null_ls.builtins.formatting.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file '.eslintrc'
            or utils.root_has_file '.eslintrc.js'
            or utils.root_has_file '.eslintrc.json'
      end,
      prefer_local = 'node_modules/.bin'
    }
  }
})

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  secerity_sort = true,
  update_in_insert = false
})

local ts = require('nvim-treesitter.configs')
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
    'bash',
    'javascript',
    'jsdoc',
    'typescript',
    'tsx',
    'html',
    'css',
    'graphql',
    'json',
    'markdown',
    'php',
    'python',
    'yaml',
    'lua',
    'vim'
  },
  autotag = {
    enable = true,
  },
}
require 'nvim-treesitter.install'.compilers = { 'clang' }
require('treesitter-context').setup()

require('nvim-autopairs').setup()
require('nvim-ts-autotag').setup()

----====================----
----=== Key Bindings ===----
----====================----

-- make 'p' no longer update register
vim.cmd [[
  xnoremap <expr> p 'pgv"'.v:register.'y'
]]

-- n mode with no prefix
wk.register({
  -- buffer
  ['<Tab>'] = {
    ':bnext<CR>',
    'Next Buffer'
  },
  ['<S-Tab>'] = {
    ':bprevious<CR>',
    'Previous Buffer'
  },
  -- increment/decrement
  ['+'] = {
    '<C-a>',
    'Increment'
  },
  ['-'] = {
    '<C-x>',
    'Increment'
  },
  -- selection
  ['<C-a>'] = {
    'ggVG',
    'Select All'
  },
  -- lspsaga
  K = {
    '<CMD>Lspsaga hover_doc<CR>',
    'Hover'
  },
  g = {
    name = 'lspsaga',
    d = {
      '<CMD>Lspsaga lsp_finder<CR>',
      'Go to Definition'
    },
    p = {
      '<CMD>Lspsaga preview_definition<CR>',
      'Preview Definition'
    },
    r = {
      '<CMD>Lspsaga rename<CR>',
      'Rename'
    },
    a = {
      '<CMD>Lspsaga code_action<CR>',
      'Code Action'
    },
    s = {
      '<CMD>Lspsaga signature_help<CR>',
      'Signature Help'
    },
    l = {
      '<CMD>Lspsaga show_line_diagnostics<CR>',
      'Show Line Diagnostics'
    },
    c = {
      '<CMD>Lspsaga show_cursor_diagnostics<CR>',
      'Show Cursor Diagnostics'
    },
  }
})

-- n mode with leader prefix
wk.register({
  -- telescope
  f = {
    function()
      builtin.find_files({
        no_ignore = false,
        hidden = true
      })
    end,
    'Find Files'
  },
  r = {
    function()
      builtin.live_grep()
    end,
    'Grep'
  },
  e = {
    function()
      telescope.extensions.file_browser.file_browser({
        path = '%:p:h',
        cwd = buffer_dir()
      })
    end,
    'File Browser'
  },
  -- buffer
  x = {
    ':bd<CR>',
    'Close Buffer'
  },
  -- terminal
  t = {
    '<CMD>lua require("FTerm").toggle()<CR>',
    'Open Terminal',
  },
  -- highlight
  n = {
    ':set hlsearch!<CR>',
    'Toggle Highlight'
  },
}, {
  prefix = '<leader>',
  mode = 'n'
})

-- t mode with no prefix
wk.register({
  -- terminal
  ['<ESC>'] = {
    '<CMD>lua require("FTerm").toggle()<CR>',
    'Close Terminal',
  },
}, {
  mode = 't'
})
