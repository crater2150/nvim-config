function! s:editft()
  let ftpl = "$MYVIMDIR/after/ftplugin/" . &ft . ".vim"
  exec "vs " . ftpl
  exec "autocmd QuitPre <buffer> source " . ftpl
endfunction

noremap <silent> <Plug>(EditFT) <cmd>call <SID>editft()<cr>
map <leader>ftp <Plug>(EditFT)
