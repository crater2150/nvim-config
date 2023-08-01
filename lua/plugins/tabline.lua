return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    {'kyazdani42/nvim-web-devicons', lazy = true },
    'nvim-lua/lsp-status.nvim',
    'crater2150/vim-theme-chroma',
  },
  event = "VeryLazy",
  opts = function(_, opts) return {
    options = {
      theme = require('chroma-theme.lualine')
    },
    tabline = {
      lualine_a = { 'branch' },
      lualine_b = {},
      lualine_c = { 'windows' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'tabs' }
    },
    sections = {
      lualine_a = { 'filename' },
      lualine_b = { 'diff', 'diagnostics' },
      lualine_x = { "require'lsp-status'.status()" },
      lualine_y = { 'filetype' },
      lualine_z = { 'searchcount', 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
  end,
}
