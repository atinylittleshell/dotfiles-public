----=====================----
----=== Version check ===----
----=====================----
if vim.fn.has('nvim-0.9') == 0 then
  error('Need Neovim v0.9+ in order to run this config!')
end

----======================----
----=== Config modules ===----
----======================----
require('vim_config')
require('autocmd')
require('plugins')
require('keys')
