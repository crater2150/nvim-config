vim.filetype.add({
	extension = {
		['vtt'] = 'vtt',
		['typ'] = 'typst',
	},
	filename = {
		['.scalafmt.conf'] = 'hocon',
		['kitty.conf'] = 'kitty',
		['neomuttrc'] = 'neomutt',
		['template'] = 'sh',
		['mbsyncrc'] = 'mbsyncrc',
	},
	pattern = {
		['${XDG_CONFIG_HOME}/kitty/*.conf'] = 'kitty',
		['${XDG_CONFIG_HOME}/kitty/*.session'] = 'kitty-session',
	},
})

-- au BufRead,BufNewFile *.ttl set filetype=rdf-turtle
-- au! BufNewFile,BufRead *.xwiki   set ft=xwiki syntax=xwiki
--
