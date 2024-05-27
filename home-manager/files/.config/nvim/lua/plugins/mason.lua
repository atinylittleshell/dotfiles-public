return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
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
      })
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require('mason-lspconfig').setup({
        automatic_installation = {
          exclude = { 'kotlin-language-server' },
        },
      })
    end,
    dependencies = {
      'williamboman/mason.nvim',
    },
  },
}
