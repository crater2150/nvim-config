local path = require("mason-core.path")

local function mason_package(...)
	return path.concat { vim.fn.stdpath("data"), "mason", "packages", ... }
end

local bundles = vim.fn.glob(
	mason_package("java-debug-adapter", "extension", "server", "com.microsoft.java.debug.plugin-*.jar"), true, true)
local extra_bundles = vim.fn.glob(mason_package("java-test", "extension", "server", "*.jar"), true, true)
vim.list_extend(bundles, extra_bundles)

require('jdtls').start_or_attach({
	cmd = { mason_package("jdtls", "bin", "jdtls") },
	on_attach = function(client, bufnr)
		require 'jdtls'.setup_dap()
	end,
	init_options = {
		bundles = extra_bundles
	},
	settings = {
		java = {
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*"
				},
				filteredTypes = {
					"com.sun.*",
					"io.micrometer.shaded.*",
					"java.awt.*",
					"jdk.*",
					"sun.*",
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
				},
				hashCodeEquals = {
					useJava7Objects = true,
				},
				useBlocks = true,
			},
			sources = {
				organizeImports = {
					starThreshold = 3,
					staticStarThreshold = 5,
				},
			},
		}
	}
})
