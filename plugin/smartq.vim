nnoremap <silent> q <cmd>call <SID>SmartQ()<CR>
function! s:SmartQ()
  if exists("g:recording_macro")
    let r = g:recording_macro
    unlet g:recording_macro
    normal! q
    execute 'let @'.r.' = @'.r.'[:-2]'
  else
    let c = nr2char(getchar())
    if c == ':'
      call feedkeys(":q")
    else
      if c =~ '\v[0-9a-zA-Z"]'
        let g:recording_macro = c
      endif
      execute 'normal! q'.c
    endif
  endif
endfunction
