" shows syntaxic group of the word under the cursor
command! SynStack :call SynStack()
function! SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
