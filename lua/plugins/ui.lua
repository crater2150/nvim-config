return {
	{
		'stevearc/dressing.nvim',
		dependencies = {
			'nvim-telescope/telescope-ui-select.nvim',
		},
		opts = {
			select = {
				backend = { 'telescope' }
			}
		}
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		opts = {
			char = "",
			char_highlight_list = {
				"Whitespace",
				"CursorLine",
			},
			space_char_highlight_list = {
				"Whitespace",
				"CursorLine",
			},
			show_trailing_blankline_indent = false,
			show_current_context = true,
			show_current_context_start = true,
		},
	}
}
