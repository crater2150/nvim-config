return { 'ryicoh/deepl.vim',
	keys = {

		{ '<leader><C-e>', function() vim.fn['deepl#v']("EN") end, mode = 'v' },
		{ '<leader><C-d>', function() vim.fn['deepl#v']("DE") end, mode = 'v' },
	},
	dependencies = {{ 'tsuyoshicho/vim-pass',
		init = function ()
			vim.g.pass_use_agent = 1
		end
	}},
	config = function ()
		vim.g['deepl#endpoint'] = "https://api-free.deepl.com/v2/translate"
		vim.g['deepl#auth_key'] = vim.fn['pass#get']('web/deepl.com', 'apikey')
	end
}
