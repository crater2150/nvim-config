imap //< <Plug>(codelines-close)<CR>
map <silent> <buffer> <leader>cl :call jobstart(['codelines', '.'])<cr>

set tw=120
set foldlevel=99

set foldmethod=indent
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
