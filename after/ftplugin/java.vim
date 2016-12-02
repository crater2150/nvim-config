iab <buffer> syso System.out.println

setlocal foldmethod=syntax
setlocal foldenable
setlocal textwidth=120

nnoremap <silent> <buffer> <leader>jc :JavaCorrect<cr>
nnoremap <silent> <buffer> <leader>jd :JavaDocComment<cr>
nnoremap <silent> <buffer> <F2>       :JavaDocPreview<cr>
nnoremap <silent> <buffer> <F3>       :JavaSearchContext<cr>
nnoremap <silent> <buffer> <leader>jf :%JavaFormat<cr>
nnoremap <silent> <buffer> <leader>ji :JavaImportOrganize<cr>
nnoremap          <buffer> <leader>jr :JavaRename<space>

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>map <silent> <buffer>     <C-Space>  <C-x><C-o>

function! InsertJavaPackage()
  let filename = expand("%")
  let filename = substitute(filename, "\.java$", "", "")
  let dir = getcwd() . "/" . filename
  let dir = substitute(dir, "^.*\/src\/", "", "")
  let dir = substitute(dir, "\/[^\/]*$", "", "")
  let dir = substitute(dir, "\/", ".", "g")
  let filename = substitute(filename, "^.*\/", "", "")
  let dir = "package " . dir . ";"
  let result = append(0, dir)
  let result = append(1, "")
  let result = append(2, "class " . filename . " {")
  let result = append(4, "}")
endfunction

"java {{{
"if filereadable(bufname("%")) == 0
"	call InsertJavaPackage()
"endif

"}}}
