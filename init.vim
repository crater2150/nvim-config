runtime packages.vim

let $MYVIMDIR=split(&rtp, ',')[0]

set exrc

set background=dark
colo chroma

if exists("&cc")
	set cc=+1
endif

set number

set textwidth=80
set tabstop=2
set shiftwidth=2

set whichwrap+=<,>,h,l

set notimeout
set ttimeout
set timeoutlen=50

set foldmethod=syntax

" disables visualbell
set vb t_vb=

set shellcmdflag=-c
set shell=/bin/zsh


set timeoutlen=500
set modeline
set showcmd

set ignorecase smartcase
set completeopt=menu,longest,preview
set wildmode=list:longest,list:full
set wildignore+=*.so,*.swp,*.zip,*.o
set suffixes=.bak,~,.h,.info,.swp,.obj,.info,.aux,.dvi,.bbl,.out,.o,.lo,\.class
set suffixes+=.pdf
set wildmenu
set hidden

set mouse=

set cursorline
set guicursor=

set undofile
set undodir=~/.local/share/nvim/undo

set spelllang=de

" custom commands
command! RC edit $MYVIMRC
command! SRC source $MYVIMRC
command! CD :cd %:h
command! PlugEdit edit $MYVIMDIR/packages.vim
command! PlugReload source $MYVIMDIR/packages.vim | PlugInstall


"{{{ latex

" controls filetype setting, therefore not possible to move to ftplugin
let g:tex_flavor = "latex"

"}}}

" {{{ misc Autocommands
augroup Misc
	au FileType mail setlocal spell
	au FileType man setlocal nonu
augroup END


augroup Cache
	autocmd!
	autocmd BufRead,BufNewFile ~/Private/* setlocal directory=.
augroup END

"{{{ binary editing
augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END
"}}}

"}}}

"{{{ c header gates
function! s:insert_gates()
	let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	execute "normal! i#ifndef " . gatename
	execute "normal! o#define " . gatename
	execute "normal! Go#endif /* " . gatename . " */"
	normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

"}}}

" common mappings {{{

nnoremap <space> za
vnoremap <silent> . :normal .<CR>

nnoremap q: :q
nnoremap <leader>: q:

map <Left>  <C-w>h
map <Down>  <C-w>j
map <Up>    <C-w>k
map <Right> <C-w>l

map <S-Left>  <C-w><
map <S-Right> <C-w>>
map <S-Down>  <C-w>-
map <S-Up>    <C-w>+

" navigate windows with alt+[hjkl]
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

inoremap <C-U> <C-G>u<C-U>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
nnoremap Y y$

inoremap <C-Space> <C-x><C-o>

nmap <C-L>         :noh<cr>:redraw!<cr>

nmap <F9>	   :make<CR>
nmap <silent> <F11> :TagbarToggle<cr>
nmap <silent> <Insert> :TagbarToggle<CR>
nmap <leader>m  :make<CR>

nmap <C-Tab> <C-w><C-w>
imap <C-Tab> <esc><C-w><C-w>

vmap <silent> gs :sort<cr>

"}}}


" Denite {{{

"call denite#custom#source('file_rec', 'matchers', ['matcher_cpsm'])
"map <silent> gb :<C-u>Denite -buffer-name=buffers buffer<cr>
"map <silent> gf :<C-u>Denite -buffer-name=files file_rec<cr>

" }}}

"Git {{{
nmap <Leader>gu         :GitPush<CR>
nmap <Leader>gvc        :!git svn dcommit<CR>
nmap <Leader>gvf        :!git svn fetch<CR>
" Git }}}

let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_disable_by_default = 1


let g:localvimrc_whitelist='/home/crater2150/code/.*'
let g:localvimrc_sandbox=0

let g:UltiSnipsEnableSnipMate = 0
let g:ale_completion_enabled = 1
" vi:foldmethod=marker sw=2
