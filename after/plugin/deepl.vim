let g:deepl#endpoint = "https://api-free.deepl.com/v2/translate"
function TranslateSelection(lang)
	if !exists('g:deepl#auth_key')
		let g:deepl#auth_key = pass#get('web/deepl.com', 'apikey')
	endif
	call deepl#v(a:lang)
endfun

vmap <leader><C-e> <Cmd>call TranslateSelection("EN")<CR>
vmap <leader><C-d> <Cmd>call TranslateSelection("DE")<CR>
