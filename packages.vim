call plug#begin(expand('<sfile>:p:h') . '/plugged')

" basic stuff
Plug 'pbrisbin/vim-mkdir'
Plug 'embear/vim-localvimrc'

"Plug 'crater2150/vim-theme-chroma'
Plug '~/sources/chroma-colors/vim'
Plug 'fladson/vim-kitty'

" tim pope stuff
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'

" motions and textobjects
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/argtextobj.vim'

Plug 'mhinz/vim-signify'

" LSP

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'scalameta/nvim-metals'
" Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'}
Plug 'nvim-lua/lsp-status.nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'L3MON4D3/LuaSnip'


Plug 'machakann/vim-highlightedyank'

" for stuff installed via disto package manager, e.g. fzf's bundled vim plugin
Plug '/usr/share/vim/vimfiles'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'lambdalisue/suda.vim'

Plug 'vim-scripts/SyntaxRange'

" ruby
Plug 'depuracao/vim-rdoc'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'

" git
"Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'
Plug 'gregsexton/gitv'
Plug 'gisphm/vim-gitignore'

" other filetype specific plugins
Plug 'jamessan/vim-gnupg'
let g:no_cecutil_maps = 1
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
