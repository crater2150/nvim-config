local on_attach = function(args)
	local client = vim.lsp.get_client_by_id(args.data.client_id)
	if client.server_capabilities.completionProvider then
		--Enable completion triggered by <c-x><c-o>
		vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
	end
	if client.server_capabilities.definitionProvider then
		vim.bo[args.buf].tagfunc = "v:lua.vim.lsp.tagfunc"
	end
	--

	-- Mappings.
	-- stylua: ignore start
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
		{ "<leader>dc",  function() require("dap").continue() end,                    "Debug: Continue" },
		{ "<leader>dK",  function() require("dap.ui.widgets").hover() end,            "Debug: Hover" },
		{ "<leader>dt",  function() require("dap").toggle_breakpoint() end,           "Debug: Toggle breakpoint" },
		{ "<leader>dso", function() require("dap").step_over() end,                   "Debug: Step over" },
		{ "<leader>dsi", function() require("dap").step_into() end,                   "Debug: Step into" },
		{ "<leader>dl",  function() require("dap").run_last() end,                    "Debug: Run last" },
		{ "<F5>",        function() require("dap").continue() end,                    "Debug: Continue" },
		{ "<M-h>",       function() require("dap.ui.widgets").hover() end,            "Debug: Hover" },
		{ "<F7>",        function() require("dap").step_over() end,                   "Debug: Step over" },
		{ "<F8>",        function() require("dap").step_into() end,                   "Debug: Step into" },
		{ "<leader>aa",  vim.diagnostic.setqflist,                                    "Add all diagnostics to quickfix list" },
		{ "<leader>aw",  function() vim.diagnostic.setqflist({ severity = "W" }) end, "Add all warnings to quickfix list" },
		{ "<leader>ae",  function() vim.diagnostic.setqflist({ severity = "E" }) end, "Add all errors to quickfix list" },
	}) do
		vim.keymap.set("n", mapping[1], mapping[2], { silent = true, buffer = args.buf, desc = mapping[3] })
	end
	-- stylua: ignore end

	vim.keymap.set("n", "<leader>dr", function()
		require("dap").repl.toggle()
	end, { silent = true, desc = "Toogle debug REPL" })

	if client.server_capabilities.signatureHelpProvider then
		vim.cmd([[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]])
		vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float({max_width = 100, focusable = false})]])
	end

	if client.server_capabilities.documentHighlightingProvider then
		vim.cmd([[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]])
		vim.cmd([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
		vim.cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
	end
end

vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach })
