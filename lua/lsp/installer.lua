local status, lsp_installer = pcall(require,"nvim-lsp-installer")
if (not status) then return end

lsp_installer.on_server_ready(function(server)
    local opts = {}

    server:setup(opts)
end)
