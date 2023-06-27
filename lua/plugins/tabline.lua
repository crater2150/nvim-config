local colors = {
  blue = '#00afff',
  lightblue = '#87afff',
  orange = '#ffaf5f',
  yellow = '#ffd75f',
  green = '#87d75f',
  red = '#ff0000',
  lightred = '#ff5f5f',
  white = '#ffffff',
  lightgray = '#c6c6c6',
  gray = '#6a6a6a',
  bggray = '#1c1c1c',
  lightbggray = '#262626',
  visualgray = '#303030',
  black = '#000000',
  normfg = '#ffffff',
  normbg = '#000000',
}

return {
  'hoob3rt/lualine.nvim',
  dependencies = {
    {'kyazdani42/nvim-web-devicons', lazy = true },
    'nvim-lua/lsp-status.nvim',
  },
  opts = {
    options = {
      theme = {
        normal = {
          a = { fg = colors.black, bg = colors.gray },
          b = { fg = colors.yellow, bg = colors.lightbggray },
          c = { fg = colors.blue, bg = colors.bggray },
          z = { fg = colors.yellow, bg = colors.gray },
        },
        inactive = {
          a = { fg = colors.black, bg = colors.gray },
          b = { fg = colors.red, bg = colors.lightbggray },
          c = { fg = colors.gray, bg = colors.bggray },
          z = { fg = colors.blue, bg = colors.gray },
        },
        insert = { a = { fg = colors.black, bg = colors.green } },
        visual = { a = { fg = colors.black, bg = colors.yellow } },
        replace = { a = { fg = colors.black, bg = colors.red } },
      }
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
      lualine_c = {},
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
}
