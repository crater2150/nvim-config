setl sts=2
setl sw=2
setl expandtab
setl omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

nmap K :!ri <cword><cr>

hi link rubySymbol Special

source $MYVIMDIR/bundle/ri-browser/ftplugin/ri.vim
