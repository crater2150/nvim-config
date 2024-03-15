-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			--vim.fn["vsnip#anonymous"](args.body)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = 'nvim_lsp' },

		-- For vsnip user.
		{ name = 'vsnip' },

		-- For luasnip user.
		-- { name = 'luasnip' },

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		{ name = 'buffer' },
	}
})

-- Setup lsp.
metals_config = require("metals").bare_config
metals_config.init_options.statusBarProvider = "on"
metals_config.settings = { showImplicitArguments = true }
metals_config.on_attach = on_attach
metals_config.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
