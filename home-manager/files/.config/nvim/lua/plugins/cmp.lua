return {
  {
    'hrsh7th/nvim-cmp',
    version = '*',
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-path' },
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        enabled = function()
          -- disable completion in comments
          local context = require('cmp.config.context')
          -- keep command mode completion enabled when cursor is in a comment
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture('comment') and not context.in_syntax_group('Comment')
          end
        end,
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        source_priority = {
          nvim_lsp = 1000,
          buffer = 500,
          path = 250,
        },
      })
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })
      cmp.setup.filetype('TelescopePrompt', {
        enabled = function()
          return false
        end,
      })
    end,
  },
  {
    'danymat/neogen',
    version = '*',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {
      enabled = true,
    },
  },
}
