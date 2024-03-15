return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		{ 'kyazdani42/nvim-web-devicons', lazy = true },
		'nvim-lua/lsp-status.nvim',
		'crater2150/vim-theme-chroma',
	},
	event = "VeryLazy",
	opts = function(_, opts)
		return {
			options = {
				theme = require('chroma-theme.lualine')
			},
			tabline = {
				lualine_a = { 'branch' },
				lualine_b = {},
				lualine_c = { { 'buffers', show_filename_only = false, symbols = { modified = " ✏️]", alternate_file = " 🔃", folder = " 📁" }, } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						'tabs',
						mode = 1,
						fmt = function(name, context)
							local buflist = vim.fn.tabpagebuflist(context.tabnr)
							local mod = not vim.tbl_isempty(vim.tbl_filter(
								function(bufnr) return vim.fn.getbufvar(bufnr, '&mod') == 1 end,
								buflist))

							local wincount = #vim.tbl_filter(
								function(i) return i == 'leaf' end,
								vim.tbl_flatten(vim.fn.winlayout(context.tabnr))
							)

							return name .. (wincount > 1 and ' +' .. (wincount - 1) or '') .. (mod and ' [✏️]]' or '')
						end
					} }
			},
			sections = {
				lualine_a = { 'filename' },
				lualine_b = { 'diff', 'diagnostics' },
				lualine_x = { "require'lsp-status'.status()" },
				lualine_y = { 'filetype' },
				lualine_z = { 'searchcount', 'selectioncount', 'location' }
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
