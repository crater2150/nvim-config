function! codelines#close()
  let n_line = search('//>', 'bnW') 
  return trim(substitute(getline(n_line), '>', '<', ''))
endfunction

inoremap <silent> <Plug>(codelines-close) <c-r>=codelines#close()<cr>
noremap <silent> <Plug>(codelines-go-to-def) :exec "vimgrep #//>" . strpart(expand('<cword>'), 3) . "# code/*"<cr>
