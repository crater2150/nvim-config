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

nmap <buffer> <F5>		<Plug>LatexChangeEnv
vmap <buffer> <leader>tw	<Plug>LatexWrapSelection
vmap <buffer> <leader>tW	<Plug>LatexEnvWrapSelection

map <silent> <buffer> <F10>      :exec "silent !xdg-open" expand("%:t:r") . ".pdf &>/dev/null"<cr><C-l>
map <silent> <buffer> <expr> <F9>       vimproc#system_bg("latexmk " . expand("%") . " &")

setlocal tw=100

map <silent> <buffer> <F3> :exec "Ack! -w " . substitute(expand('<cword>'), 'SRC','\\>','')<cr>v:ccl<cr>zR
