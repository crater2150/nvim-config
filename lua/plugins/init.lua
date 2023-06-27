return {
	"folke/which-key.nvim",
	'pbrisbin/vim-mkdir',
	'fladson/vim-kitty',

	'tpope/vim-repeat',
	'tpope/vim-surround',
	'tpope/vim-characterize',
	'tpope/vim-eunuch',
	'tpope/vim-commentary',
	'tpope/vim-sleuth',

	-- ic / ac
	{'glts/vim-textobj-comment',
		dependencies = { 'kana/vim-textobj-user' }
	},
	-- ii / ai
	'michaeljsmith/vim-indent-object',
	'airblade/vim-gitgutter',

	'neovim/nvim-lspconfig',

	{ 'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{ 'ray-x/lsp_signature.nvim',
		config = function()
			require('lsp_signature').setup({})
		end
	},
	'kyazdani42/nvim-web-devicons',
	'folke/trouble.nvim',
	'folke/lsp-colors.nvim',
	'nvim-lua/popup.nvim',

	'junegunn/vim-easy-align',
	'machakann/vim-highlightedyank',
	'lukas-reineke/indent-blankline.nvim',
	'lambdalisue/suda.vim',
	-- git
	'lambdalisue/gina.vim',
	'gregsexton/gitv',
	'gisphm/vim-gitignore',
	'sjl/splice.vim',
	'jamessan/vim-gnupg',

	{'lervag/vimtex',
		init = function()
			vim.g.tex_conceal="agm"
			vim.g.vimtex_quickfix_ignorefilters = { 'overfull', 'underfull' }
		end,
		ft = "tex",
	},
	'ledger/vim-ledger',
	'anekos/hledger-vim',

	'vim-pandoc/vim-pandoc',
	'vim-pandoc/vim-pandoc-syntax',
	'isobit/vim-caddyfile',
	'GEverding/vim-hocon',
	'nfnty/vim-nftables',
}
--  'powerman/vim-plugin-AnsiEsc',
