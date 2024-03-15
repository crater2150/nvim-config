vim.keymap.set("n", "<leader>o",
	function() vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } }) end,
	{ desc = "Organize imports" }
)
vim.keymap.set("n", "<leader>s", function() require('nvim-quick-switcher').toggle('tsx', 'scss') end, { buffer = true })

local function goToCSSClassDefinition()
	local node = vim.treesitter.get_node()
	if not node then return false end

	local parent = node:parent()
	if not parent then return false end

	local grandparent = parent:parent()
	if not grandparent then return false end

	local className
	if node:type() == "string_fragment" and grandparent:type() == "jsx_attribute" and vim.treesitter.get_node_text(grandparent:named_child(0), 0) == "className" then
		className = vim.treesitter.get_node_text(node, 0)
	elseif parent:type() == "jsx_attribute" and vim.treesitter.get_node_text(parent:named_child(0), 0) == "className" then
		className = vim.treesitter.get_node_text(parent:named_child(1):named_child(0), 0)
	elseif node:type() == "jsx_attribute" and vim.treesitter.get_node_text(node:named_child(0), 0) == "className" then
		className = vim.treesitter.get_node_text(node:named_child(1):named_child(0), 0)
	end

	if className then
		require('nvim-quick-switcher').toggle('tsx', 'scss', { only_existing = true })
		local query = vim.treesitter.query.parse("scss", "((class_name) @cn (#eq? @cn \"" .. className .. "\"))")
		local tree = vim.treesitter.get_node():tree()
		vim.fn.setqflist({})
		local start, _, stop, _ = tree:root():range()
		local anyMatch = false
		for _, match, _ in query:iter_matches(tree:root(), 0, start, stop) do
			anyMatch = true
			for _, node in pairs(match) do
				local row, col = node:start()
				vim.api.nvim_win_set_cursor(0, { row + 1, col })
				vim.fn.setqflist({ {
					lnum = row + 1,
					col = col + 1,
					text = "class selector: " .. className,
					filename = vim.fn.expand('%:p'),
					bufnr = vim.fn.bufnr('%'),
				} }, 'a')
			end
		end
		if not anyMatch then
			require('nvim-quick-switcher').toggle('tsx', 'scss', { only_existing = true })
		end
		return true
	end
	return false
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.keymap.set("n", "gd", function() if not goToCSSClassDefinition() then require('telescope.builtin').lsp_definitions() end end,
			{ buffer = true })
	end
})
