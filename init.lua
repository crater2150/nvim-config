if vim.env['VIRTUAL_ENV'] ~= nil then
	vim.g.python3_host_prog = vim.fn.system("which -a python3 | sed -n 2p | tr -d '\n'")
else
	vim.g.python3_host_prog = vim.fn.system("which python3 | tr -d '\n'")
end

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
	dev = {
		path = "~/projects/nvim/",
		patterns = { "crater2150" },
		fallback = true
	}
})

vim.opt.background = "dark"
vim.opt.number = true
vim.opt.title = true

vim.opt.colorcolumn = "+1"
vim.opt.textwidth = 80
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.whichwrap = "b,s,<,>,[,],h,l"

vim.opt.timeout = false

vim.opt.foldenable = false

vim.opt.diffopt:append("vertical")
vim.opt.diffopt:append("linematch:50")
-- todo visualbell needed?

vim.opt.shell = "/bin/zsh"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.listchars = "tab:⇥\\ ,trail:-,nbsp:+,lead:␣"
--vim.opt.list = true
vim.cmd [[hi link Whitespace Comment]]

vim.opt.wildmode = { "list:longest", "list:full" }
vim.opt.wildignore = { "*.so", "*.swp", "*.zip", "*.o" }
vim.opt.suffixes = {
	".bak", "~", ".h", ".info", ".swp", ".obj", ".info", ".aux", ".dvi", ".bbl", ".out", ".o", ".lo",
	"\\.class", ".pdf" }

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.mouse = ''
vim.opt.shortmess = vim.o.shortmess .. "c"

vim.opt.cursorline = true
vim.opt.undofile = true

vim.opt.spelllang = 'de,en'

vim.opt.termguicolors = true
vim.opt.pumblend = 10

vim.opt.updatetime = 300

local command = vim.api.nvim_create_user_command
local initlua = vim.fn.stdpath('config') .. '/init.lua'
command('RC', function() vim.cmd.edit(initlua) end, { desc = 'edit init.lua' })
command('CD', ':cd %:h', { desc = 'cd to current file' })
command('TrailingSpace', '%s/\\s*$//g', { desc = 'remove trailing spaces' })

vim.g.tex_flavor = 'latex'

local key = vim.keymap.set

key('n', '<space>', 'za', { desc = 'toggle fold' })
key('v', '.', '<cmd>normal .<CR>', { desc = 'repeat last command in visual mode' })
key('n', 'cy', '"*y', { desc = 'copy to system clipboard' })

key('t', '<C-q>', '<C-\\><C-n>', { desc = 'exit terminal mode' })

-- Arrow keys for window movement and resizing
key('n', '<Left>', '<C-w>h')
key('n', '<Down>', '<C-w>j')
key('n', '<Up>', '<C-w>k')
key('n', '<Right>', '<C-w>l')
--
key('n', '<S-Left>', "<C-w><")
key('n', '<S-Right>', "<C-w>>")
key('n', '<S-Down>', "<C-w>-")
key('n', '<S-Up>', "<C-w>+")

key('n', '<M-[>', function() vim.fn.search('^[^[:space:])\\]}]', 'be') end, { desc = 'jump to previous unindented line' })
key('n', '<M-]>', function() vim.fn.search('^[^[:space:])\\]}]', 'e') end, { desc = 'jump to next unindented line' })

key('i', '<C-U>', '<C-G>u<C-U>')
key('n', '&', ':&&<CR>')
key('x', '&', ':&&<CR>')
key('n', 'Y', 'y$')


key('i', '<C-Space>', '<C-x><C-o>', { desc = 'completion' })
key('n', '<C-l>', '<cmd>noh<CR><cmd>redraw!<CR>', { desc = 'clear search highlight' })
key('v', 'gs', "<cmd>'<,'>sort<CR>", { desc = 'sort selection' })


key({ 'n', 'x' }, '<M-a>', "<Plug>(EasyAlign)", { desc = 'align selection' })
