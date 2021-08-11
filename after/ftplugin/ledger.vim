set textwidth=0
inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
vnoremap <silent> <buffer> <Tab> :LedgerAlign<CR>
inoremap <S-TAB> <TAB>
noremap { ?^\d<CR>
noremap } /^\d<CR>
noremap <leader>F <cmd>%LedgerAlign<cr>
noremap <leader>f <cmd>LedgerAlign<cr>
