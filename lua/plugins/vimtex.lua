return {
	"lervag/vimtex",
	init = function()
		vim.g.tex_conceal = "agm"
		vim.g.vimtex_quickfix_ignorefilters = { "overfull", "underfull" }
		vim.g.vimtex_syntax_enabled = 0
	end,
	ft = "tex",
}
