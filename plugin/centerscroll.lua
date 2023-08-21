-- " from https://vi.stackexchange.com/a/26055
-- augroup KeepCentered
--   autocmd!
--   autocmd CursorMoved * if &buftype == '' | normal! zz | endif
-- augroup END

vim.api.nvim_create_augroup("KeepCentered", { clear = true })
vim.api.nvim_create_autocmd("CursorMoved", {
  group = "KeepCentered",
  pattern = '*',
  callback = function() 
    if vim.o.buftype == '' then
      vim.cmd([[normal! zz]])
    end
  end,
})
