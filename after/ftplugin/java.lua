vim.api.nvim_buf_set_option(0, 'textwidth', 120)
vim.cmd.iabbrev('syso', 'System.out.println')

local bmap = vim.keymap.set
local map_opt = { silent = true, buffer = true }

bmap('n', '<leader>ev', function() require('jdtls').extract_variable() end,
	{ silent = true, buffer = true, desc = 'Extract variable'})
bmap('v', '<leader>ev', function() require('jdtls').extract_variable(true) end,
	{ silent = true, buffer = true, desc = 'Extract variable'})
bmap('n', '<leader>ec', function() require('jdtls').extract_constant() end,
	{ silent = true, buffer = true, desc = 'Extract constant'})
bmap('v', '<leader>ec', function() require('jdtls').extract_constant(true) end,
	{ silent = true, buffer = true, desc = 'Extract constant'})
bmap('v', '<leader>em', function() require('jdtls').extract_method(true) end,
	{ silent = true, buffer = true, desc = 'Extract method'})
bmap('n', '<leader>ro', function() require('jdtls').organize_imports() end,
	{ silent = true, buffer = true, desc = 'Organize imports'})
bmap('n', '<leader>tc', function() require 'jdtls'.test_class() end,
	{ silent = true, buffer = true, desc = 'Test class'})
bmap('n', '<leader>tm', function() require 'jdtls'.test_nearest_method() end,
	{ silent = true, buffer = true, desc = 'Test nearest method'})
