return {
	{
		'stevearc/dressing.nvim',
		enabled = true,
		dependencies = {
			--'nvim-telescope/telescope-ui-select.nvim',
		},
		opts = {
			select = {
				backend = { 'telescope' }
			}
		}
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {
			whitespace = { highlight = { "Whitespace", "CursorLine" }, remove_blankline_trail = false, },
			indent = { highlight = { "Whitespace", "CursorLine" }, char = "" },
			scope = { enabled = true, },
		},
	}
}
