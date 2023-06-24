vim.keymap.set("n", "<leader>o",
	function() vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } }) end,
	{ desc = "Organize imports" }
)
