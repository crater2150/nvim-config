return {
  --'crater2150/vim-theme-chroma-lush',
  'crater2150/vim-theme-chroma',
  dev = true,
  lazy = false,
  priority = 1000,
  config = function() vim.cmd.colorscheme("chroma") end
}
