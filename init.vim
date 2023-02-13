if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

runtime packages.vim

let $MYVIMDIR=split(&rtp, ',')[0]

set exrc

set background=dark
let g:chroma_italic_style="bold"
let g:chroma_nontext_dark=1
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
set ttimeoutlen=50

set foldmethod=syntax
set foldlevelstart=99

" disables visualbell
set vb t_vb=

set shellcmdflag=-c
set shell=/bin/zsh

set modeline
set showcmd

set ignorecase smartcase
set inccommand=split
set wildmode=list:longest,list:full
set wildignore+=*.so,*.swp,*.zip,*.o
set suffixes=.bak,~,.h,.info,.swp,.obj,.info,.aux,.dvi,.bbl,.out,.o,.lo,\.class
set suffixes+=.pdf
set wildmenu
set hidden

"set completeopt=menu,noinsert,preview
"set completeopt=menuone,noinsert,noselect
set completeopt=menu,menuone,noselect
set shortmess+=c
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set mouse=

set cursorline
set guicursor=

set undofile
set undodir=~/.local/share/nvim/undo

set spelllang=de

set termguicolors
set pumblend=20

set updatetime=300

" custom commands
command! RC edit $MYVIMRC
command! SRC source $MYVIMRC
command! CD :cd %:h
command! PlugEdit edit $MYVIMDIR/packages.vim
command! PlugReload source $MYVIMDIR/packages.vim | PlugInstall
command! TrailingSpace %s/\s*$//g


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

" common mappings {{{

nnoremap <space> za
vnoremap <silent> . <cmd>normal .<CR>
noremap cy "*y

tnoremap <C-q> <C-\><C-n>

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

nnoremap <M-[> :call search('^[^[:space:])\]}]', 'be')<cr>
nnoremap <M-]> :call search('^[^[:space:])\]}]', 'e')<cr>

inoremap <C-U> <C-G>u<C-U>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
nnoremap Y y$

inoremap <C-Space> <C-x><C-o>

nmap <C-L>         <cmd>noh<cr><cmd>redraw!<cr>

nmap <C-Tab> <C-w><C-w>
imap <C-Tab> <esc><C-w><C-w>

vmap <silent> gs <cmd>'<,'>sort<cr>

"}}}


"Git {{{
nmap <Leader>gu         <cmd>Gina push<CR>
nmap <Leader>gvc        <cmd>!git svn dcommit<CR>
nmap <Leader>gvf        <cmd>!git svn fetch<CR>
" Git }}}

let g:signify_vcs_list = [ 'git', 'hg' ]
"let g:signify_disable_by_default = 1


let g:localvimrc_whitelist='/home/crater2150/work/.*'
let g:localvimrc_sandbox=0

lua require("my-lsp")
lua require("lsputils")
lua require("conf.cmp")
lua require("conf.trouble")
lua require("conf.treesitter")
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
" vi:foldmethod=marker sw=2
