call plug#begin(expand('<sfile>:p:h') . '/plugged')

" basic stuff
Plug 'pbrisbin/vim-mkdir'
Plug 'embear/vim-localvimrc'
Plug 'Soares/smarttab.vim'

Plug 'crater2150/vim-theme-chroma'

" tim pope stuff
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'

" motions and textobjects
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'vim-scripts/argtextobj.vim'

Plug 'mhinz/vim-signify'
Plug 'neomake/neomake'
"Plug 'vim-syntastic/syntastic'
Plug 'Chiel92/vim-autoformat'

" completion and snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}



Plug '/usr/share/vim/vimfiles'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'vim-airline/vim-airline'

Plug 'vim-scripts/SyntaxRange'

" ruby
Plug 'depuracao/vim-rdoc'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'

" git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'gisphm/vim-gitignore'

" C
Plug 'derekwyatt/vim-fswitch'


"Scala
Plug 'derekwyatt/vim-scala'
Plug 'buntec/neovim-scalavista', { 'do': ':UpdateRemotePlugins' }

" Rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'w0rp/ale'

" other filetype specific plugins
Plug 'jamessan/vim-gnupg'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'tpope/vim-markdown'
Plug 'lervag/vimtex'
" let g:vimtex_compiler_method = 'arara'
Plug 'ledger/vim-ledger'
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'gre/play2vim'
Plug 'isobit/vim-caddyfile'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

" vim:ft=vim foldmethod=marker
