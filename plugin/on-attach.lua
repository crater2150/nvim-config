local on_attach = function(args)
	--Enable completion triggered by <c-x><c-o>
	vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	for _, mapping in ipairs({
		{ 'gD',          vim.lsp.buf.declaration,                                     "Go to declaration" },
		{ 'gd',          require('telescope.builtin').lsp_definitions,                "Go to definition" },
		{ 'gi',          vim.lsp.buf.implementation,                                  "Go to implementation" },
		{ '<C-k>',       vim.lsp.buf.signature_help,                                  "Show signature help" },
		{ '<Leader>D',   vim.lsp.buf.type_definition,                                 "Go to type definition" },
		{ '<Leader>rn',  vim.lsp.buf.rename,                                          "Rename" },
		{ '<M-x>',       vim.lsp.buf.code_action,                                     "Code action" },
		{ '<M-s>',       vim.lsp.codelens.run,                                        "Run code lens" },
		{ 'gr',          vim.lsp.buf.references,                                      "Go to references" },
		{ '<M-e>',       vim.diagnostic.open_float,                                   "Open diagnostics" },
		{ '[d',          vim.diagnostic.goto_prev,                                    "Go to previous diagnostic" },
		{ '[d',          vim.diagnostic.goto_prev,                                    "Go to next diagnostic" },
		{ '<M-q>',       vim.diagnostic.setloclist,                                   "Add buffer diagnostics to location list" },
		{ "<Leader>f",   function() vim.lsp.buf.format { async = true } end,          "Format buffer" },
		{ "<leader>dc",  function() require("dap").continue() end,                    "Debug: Continue" },
		{ "<leader>dK",  function() require("dap.ui.widgets").hover() end,            "Debug: Hover" },
		{ "<leader>dt",  function() require("dap").toggle_breakpoint() end,           "Debug: Toggle breakpoint" },
		{ "<leader>dso", function() require("dap").step_over() end,                   "Debug: Step over" },
		{ "<leader>dsi", function() require("dap").step_into() end,                   "Debug: Step into" },
		{ "<leader>dl",  function() require("dap").run_last() end,                    "Debug: Run last" },
		{ "<leader>aa",  vim.diagnostic.setqflist,                                    "Add all diagnostics to quickfix list" },
		{ "<leader>aw",  function() vim.diagnostic.setqflist({ severity = "W" }) end, "Add all warnings to quickfix list" },
		{ "<leader>ae",  function() vim.diagnostic.setqflist({ severity = "E" }) end, "Add all errors to quickfix list" },
	}) do
		vim.keymap.set('n', mapping[1], mapping[2], { silent = true, buffer = args.buf, desc = mapping[3] })
	end

	vim.keymap.set("n", "<leader>dr", function() require("dap").repl.toggle() end, { silent = true, desc = "Toogle debug REPL" })

	vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
	vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float({max_width = 100, focusable = false})]]
end

vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach })
