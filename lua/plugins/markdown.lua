return {
	'euclio/vim-markdown-composer',
	build = 'cargo build --release',
	enabled = function() return vim.fn.executable("cargo") end
}
