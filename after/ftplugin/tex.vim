if exists("&cole")
  " conceal" Use conceal vim 7.3 feature:
  set cole=0	" conceal level
  " Conceal in tex file: "admgs", a=accents, d=delimiters, m=math symbols,
  " g=Greek, s=superscripts/subscripts:
  let g:tex_conceal="agm"
endif

imap <buffer> [[         \begin{<C-x><C-o>
imap <buffer> ]]         <Plug>(vimtex-delim-close)
imap <buffer> [(         \left(

setlocal tw=100

map <silent> <buffer> <F3> <Plug>(codelines-go-to-def)
map <silent> <buffer> <leader>cl :call jobstart(['codelines', '.'])<cr>
