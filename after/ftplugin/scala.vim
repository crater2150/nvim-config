noremap <Leader>f :Autoformat<CR>

imap //< <Plug>(codelines-close)<CR>
map <silent> <buffer> <leader>cl :call jobstart(['codelines', '.'])<cr>

au BufWritePost *.scala Neomake!
