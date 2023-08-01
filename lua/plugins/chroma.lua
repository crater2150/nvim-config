return {
  'crater2150/vim-theme-chroma',
  dev = true,
  lazy = false,
  branch = 'lush',
  priority = 1000,
  config = function() vim.cmd.colorscheme("chroma") end
}
