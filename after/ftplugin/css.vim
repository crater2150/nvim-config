
function GetColor()
	let l:output = system('zenity --color-selection')
	return substitute(l:output, '[\r\n]*$', '', '')
endfunction

nnoremap <leader>c "=GetColor()<cr>p
inoremap <C-\>c <C-r>=GetColor()<cr>


