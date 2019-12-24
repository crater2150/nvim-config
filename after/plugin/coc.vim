map <silent> gd <Plug>(coc-definition)

map <silent> <M-=> :call CocAction("doHover")<cr>
map <silent> <Leader>t <Plug>(coc-type-definition)
map <silent> <Leader>u <Plug>(coc-references)
map <silent> <Leader>r <Plug>(coc-rename)
map <silent> <Leader>q <Plug>(coc-quickfix)

map <silent> <Leader>F <Plug>(coc-format)
map <silent> <Leader>f <Plug>(coc-format-selected)
vmap <silent> <Leader>f <Plug>(coc-format-selected)

map <silent> <M-a> <Plug>(coc-codeaction)
vmap <silent> <M-a> <Plug>(coc-codeaction-selected)

omap <silent> af <Plug>(coc-funcobj-a)
omap <silent> if <Plug>(coc-funcobj-i)

