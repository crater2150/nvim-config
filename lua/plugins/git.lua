return {
	'lambdalisue/gina.vim',
	'gisphm/vim-gitignore',
	'sjl/splice.vim',
	{
		'lewis6991/gitsigns.nvim',
		config = {
			signs = {
				add    = { text = '▌' },
				change = { text = '▐' },
			},
		}
	},
}
