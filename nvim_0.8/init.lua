----=====================----
----=== Version check ===----
----=====================----
if vim.fn.has('nvim-0.8') == 0 then
  error('Need Neovim v0.8+ in order to run this config!')
end

----======================----
----=== impatient.nvim ===----
----======================----
do
  local ok, _ = pcall(require, 'impatient')

  if not ok then
    vim.notify('impatient.nvim not installed yet', vim.log.levels.WARN)
  end
end

----======================----
----=== Config modules ===----
----======================----
require('plugins')
require('plugins_config')
require('vim_config')

