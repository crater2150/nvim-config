noremap <Leader>f :Autoformat<CR>

imap //< <Plug>(codelines-close)<CR>
map <silent> <buffer> <leader>cl :call jobstart(['codelines', '.'])<cr>

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

au BufWritePost *.scala Neomake!

set tw=120
