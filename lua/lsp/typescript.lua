local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return function() end end

return function(on_attach)
    local protocol = require('vim.lsp.protocol')

    -- TypeScript
    nvim_lsp.tsserver.setup {
      on_attach = on_attach,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      cmd = { "typescript-language-server", "--stdio" }
    }
end
