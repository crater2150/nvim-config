imap <buffer> [[         \begin{<C-x><C-o>
imap <buffer> ]]         <Plug>(vimtex-delim-close)
imap <buffer> [(         \left(

setlocal tw=100

map <silent> <buffer> <F3> <Plug>(codelines-go-to-def)
map <silent> <buffer> <leader>cl :call jobstart(['codelines', '.'])<cr>
