return {
	"pbrisbin/vim-mkdir",
	"fladson/vim-kitty",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-characterize",
	"tpope/vim-commentary",

	{ "chrisgrieser/nvim-genghis", dependencies = "stevearc/dressing.nvim" },

	-- ic / ac
	{
		"glts/vim-textobj-comment",
		dependencies = { "kana/vim-textobj-user" },
	},
	-- ii / ai
	"michaeljsmith/vim-indent-object",
	"neovim/nvim-lspconfig",

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({})
		end,
	},
	"kyazdani42/nvim-web-devicons",
	"folke/trouble.nvim",
	"folke/lsp-colors.nvim",
	"nvim-lua/popup.nvim",
	{
		"junegunn/vim-easy-align",
		keys = { { "<M-a>", "<Plug>(EasyAlign)", mode = { "n", "x" } } },
	},
	"machakann/vim-highlightedyank",
	"lambdalisue/suda.vim",
	"jamessan/vim-gnupg",

	--"vim-pandoc/vim-pandoc",
	--"vim-pandoc/vim-pandoc-syntax",
	"isobit/vim-caddyfile",
	"Glench/Vim-Jinja2-Syntax",
	"Everduin94/nvim-quick-switcher",
}
--  'powerman/vim-plugin-AnsiEsc',
