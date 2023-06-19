local on_attach = function(args)
  local bufnr = args.buf
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Mappings.
  local opts = { silent = true, buffer = bufnr }
  local loud = { buffer = bufnr }

  local map = vim.keymap.set
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map("n", "<leader>dr", function() require("dap").repl.toggle() end, { silent = true })
  map('n', 'gD', vim.lsp.buf.declaration, opts)
  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('v', 'K', vim.lsp.buf.hover, opts)
  map('n', 'gi', vim.lsp.buf.implementation, opts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  map('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
  map('n', '<Leader>rn', vim.lsp.buf.rename, opts)
  map('n', '<M-x>', vim.lsp.buf.code_action, loud)
  map('n', '<M-s>', vim.lsp.codelens.run, loud)
  map('n', 'gr', vim.lsp.buf.references, opts)
  map('n', '<M-e>', vim.diagnostic.open_float, opts)
  map('n', '[d', vim.diagnostic.goto_prev, opts)
  map('n', ']d', vim.diagnostic.goto_next, opts)
  map('n', '<M-q>', vim.diagnostic.setloclist, opts)
  map("n", "<Leader>f", function() vim.lsp.buf.format { async = true } end, opts)
  map("n", "<leader>dc", function() require("dap").continue() end, opts)
  map("n", "<leader>dK", function() require("dap.ui.widgets").hover() end, opts)
  map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, opts)
  map("n", "<leader>dso", function() require("dap").step_over() end, opts)
  map("n", "<leader>dsi", function() require("dap").step_into() end, opts)
  map("n", "<leader>dl", function() require("dap").run_last() end, opts)

  map("n", "<leader>aa", vim.diagnostic.setqflist, opts)
  map("n", "<leader>aw", function() vim.diagnostic.setqflist({ severity = "W" }) end, opts)
  map("n", "<leader>ae", function() vim.diagnostic.setqflist({ severity = "E" }) end, opts)

  vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
  vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float({max_width = 100, focusable = false})]]
end

vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach })
