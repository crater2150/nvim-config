"autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <M-=> :EnType<CR>

noremap <F3> :EnDeclaration<CR>
noremap gd :EnDeclaration<CR>
noremap gD :EnDeclarationSplit v<CR>
noremap <Leader>o :EnOrganizeImports<CR>
noremap <Leader>i :EnSuggestImport<CR>
noremap <Leader>rr :EnRename<CR>
noremap <Leader>ri :EnInline<CR>
noremap K :EnDocBrowse<CR>

noremap <Leader>f :Autoformat<CR>

imap //< <Plug>(codelines-close)<CR>
map <silent> <buffer> <leader>cl :call jobstart(['codelines', '.'])<cr>

au BufWritePost *.scala Neomake!
