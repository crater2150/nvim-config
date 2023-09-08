local on_attach = function(args)
  local bufnr = args.buf
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Mappings.
  local opts = { silent = true, buffer = bufnr }
  local loud = { buffer = bufnr }
  local desc = function(text) return { silent = true, buffer = bufnr, desc = text} end

  local map = vim.keymap.set
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map("n", "<leader>dr", function() require("dap").repl.toggle() end, { silent = true })
  map('n', 'gD', vim.lsp.buf.declaration, desc("Go to declaration"))
  map('n', 'gd', vim.lsp.buf.definition, desc("Go to definition"))
  map('n', 'gi', vim.lsp.buf.implementation, desc("Go to implementation"))
  map('n', '<C-k>', vim.lsp.buf.signature_help, desc("Show signature help"))
  map('n', '<Leader>D', vim.lsp.buf.type_definition, desc("Go to type definition"))
  map('n', '<Leader>rn', vim.lsp.buf.rename, desc("Rename"))
  map('n', '<M-x>', vim.lsp.buf.code_action, desc("Code action"))
  map('n', '<M-s>', vim.lsp.codelens.run, desc("Run code lens"))
  map('n', 'gr', vim.lsp.buf.references, desc("Go to references"))
  map('n', '<M-e>', vim.diagnostic.open_float, desc("Open diagnostics"))
  map('n', '[d', vim.diagnostic.goto_prev, desc("Go to previous diagnostic"))
  map('n', '[d', vim.diagnostic.goto_prev, desc("Go to next diagnostic"))
  map('n', '<M-q>', vim.diagnostic.setloclist, desc("Add buffer diagnostics to location list"))
  map("n", "<Leader>f", function() vim.lsp.buf.format { async = true } end, desc("Format buffer"))
  map("n", "<leader>dc", function() require("dap").continue() end, desc("Debug: Continue"))
  map("n", "<leader>dK", function() require("dap.ui.widgets").hover() end, desc("Debug: Hover"))
  map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, desc("Debug: Toggle breakpoint"))
  map("n", "<leader>dso", function() require("dap").step_over() end, desc("Debug: Step over"))
  map("n", "<leader>dsi", function() require("dap").step_into() end, desc("Debug: Step into"))
  map("n", "<leader>dl", function() require("dap").run_last() end, desc("Debug: Run last"))

  map("n", "<leader>aa", vim.diagnostic.setqflist, desc("Add all diagnostics to quickfix list"))
  map("n", "<leader>aw", function() vim.diagnostic.setqflist({ severity = "W" }) end, desc("Add all warnings to quickfix list"))
  map("n", "<leader>ae", function() vim.diagnostic.setqflist({ severity = "E" }) end, desc("Add all errors to quickfix list"))

  vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
  vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float({max_width = 100, focusable = false})]]
end

vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach })
