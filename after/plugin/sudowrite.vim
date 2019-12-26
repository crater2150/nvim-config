command! -nargs=? -complete=file SudoEdit exec ':e suda://' . fnamemodify(empty(<q-args>) ? expand('%') : <q-args>, ':p')
command! SudoWrite :w suda://%
