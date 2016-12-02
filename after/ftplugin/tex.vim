" set makeprg=latexmk

setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
  setlocal makeprg=make
else
  exec "setlocal makeprg=make\\ -f\\ ~/.config/makefiles/latex.mk\\ " . substitute(bufname("%"),"tex$","pdf", "")
endif

let g:LatexBox_completion_environments += [
	\ {'word': 'frame',       'menu': 'beamer frame'},
	\ {'word': 'block',       'menu': 'beamer block'},
	\ {'word': 'alertblock',  'menu': 'beamer block'},
	\ {'word': 'tikzpicture', 'menu': 'tikz'},
	\ {'word': 'cases',       'menu': 'math cases'},
	\ {'word': 'lstlisting',  'menu': 'code listing'},
	\ {'word': 'matrix',      'menu': 'matrix'},
	\ {'word': 'pmatrix',     'menu': '(matrix)'},
	\ {'word': 'bmatrix',     'menu': '[matrix]'},
	\ {'word': 'Bmatrix',     'menu': '{matrix}'},
	\ {'word': 'subfigure',   'menu': 'subfigure'},
	\ {'word': 'split',       'menu': 'math split'},
\]

let g:LatexBox_completion_commands += [
	\ {'word': '\ExplSyntaxOn',  'menu': 'start LaTeX3 syntax'},
	\ {'word': '\ExplSyntaxOff', 'menu': 'stop LaTeX3 syntax'},
	\ {'word': '\frametitle',    'menu': 'beamer title'},
	\ {'word': '\alert',         'menu': 'beamer title'},
	\ {'word': '\uncover<',      'menu': 'beamer uncover', 'abbr': '\uncover'}
\]

if exists("&cole")
  " conceal" Use conceal vim 7.3 feature:
  set cole=0	" conceal level
  " Conceal in tex file: "admgs", a=accents, d=delimiters, m=math symbols,
  " g=Greek, s=superscripts/subscripts:
  let g:tex_conceal="agm"
endif

imap <buffer> [[         \begin{<C-x><C-o>
imap <buffer> ]]         <Plug>LatexCloseCurEnv
imap <buffer> [(         \left(

nmap <buffer> <F5>		<Plug>LatexChangeEnv
vmap <buffer> <leader>tw	<Plug>LatexWrapSelection
vmap <buffer> <leader>tW	<Plug>LatexEnvWrapSelection

map <silent> <buffer> <F10>      :exec "silent !xdg-open" expand("%:t:r") . ".pdf &>/dev/null"<cr><C-l>
map <silent> <buffer> <expr> <F9>       vimproc#system_bg("latexmk " . expand("%") . " &")

setlocal tw=100
