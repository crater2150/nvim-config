local mylsp = require("my-lsp")
local path = require("mason-core.path")

local function mason_package(...)
	return path.concat{vim.fn.stdpath("data"), "mason", "packages", ...}
end

local bundles = vim.fn.glob(mason_package("java-debug-adapter", "extension", "server", "com.microsoft.java.debug.plugin-*.jar"), true, true)
local extra_bundles = vim.fn.glob(mason_package("java-test", "extension", "server", "*.jar"), true, true)
vim.list_extend(bundles, extra_bundles)

require('jdtls').start_or_attach({
	cmd = {mason_package("jdtls", "bin", "jdtls") },
	on_attach = function(client, bufnr)
		require'jdtls.setup'.add_commands()
		require'jdtls'.setup_dap()
		mylsp.on_attach(client, bufnr)
	end,
	init_options = {
		bundles = extra_bundles
	}
})
