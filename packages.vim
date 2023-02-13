call plug#begin(expand('<sfile>:p:h') . '/plugged')

" basic stuff
Plug 'pbrisbin/vim-mkdir'
Plug 'embear/vim-localvimrc'

Plug 'crater2150/vim-theme-chroma'
"Plug '~/sources/chroma-colors/vim'
Plug 'fladson/vim-kitty'

" generic
Plug 'ryicoh/deepl.vim'

" tim pope stuff
Plug 'tpope/vim-repeat'       " . for commands from plugins
Plug 'tpope/vim-surround'     " add/remove braces,quotes,...
Plug 'tpope/vim-characterize' " More info in ga output
Plug 'tpope/vim-eunuch'       " :Delete, :Move, etc.
Plug 'tpope/vim-commentary'   " gc operator
Plug 'tpope/vim-sleuth'       " detect shiftwidth/expandtab
"
" motions and textobjects
Plug 'kana/vim-textobj-user' | Plug 'glts/vim-textobj-comment' " ic / ac
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/argtextobj.vim'

Plug 'airblade/vim-gitgutter'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'nvim-lua/plenary.nvim'
Plug 'scalameta/nvim-metals'
Plug 'williamboman/nvim-lsp-installer'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/lsp-status.nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'

Plug 'mfussenegger/nvim-dap'


Plug 'machakann/vim-highlightedyank'

Plug 'junegunn/vim-easy-align'

" for stuff installed via disto package manager, e.g. fzf's bundled vim plugin
Plug '/usr/share/vim/vimfiles'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'lambdalisue/suda.vim'

Plug 'vim-scripts/SyntaxRange'

Plug 'lukas-reineke/indent-blankline.nvim'

" ruby
Plug 'depuracao/vim-rdoc'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'

" git
Plug 'lambdalisue/gina.vim'
Plug 'gregsexton/gitv'
Plug 'gisphm/vim-gitignore'
Plug 'sjl/splice.vim'


" other filetype specific plugins
Plug 'jamessan/vim-gnupg'
let g:no_cecutil_maps = 1
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'tpope/vim-markdown'
Plug 'lervag/vimtex'
" let g:vimtex_compiler_method = 'arara'
Plug 'ledger/vim-ledger'
Plug 'anekos/hledger-vim'
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'gre/play2vim'
Plug 'isobit/vim-caddyfile'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'GEverding/vim-hocon'
Plug 'nfnty/vim-nftables'

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
