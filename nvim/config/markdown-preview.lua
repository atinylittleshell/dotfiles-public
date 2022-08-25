return {
  "iamcco/markdown-preview.nvim",
  run = function() vim.fn["mkdp#util#install"]() end,
  config = function() vim.g.mkdp_auto_start = 1 end
}
