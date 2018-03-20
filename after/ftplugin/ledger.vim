set textwidth=0

inoremap <S-TAB> <TAB>
inoremap <TAB> <C-R>=SmartTab()<CR>
inoremap <BS> <C-R>=SmartDelete()<CR>
noremap { ?^\d<CR>
noremap } /^\d<CR>
noremap <leader>F :%LedgerAlign<cr>
noremap <leader>f :LedgerAlign<cr>
