local status, metals = pcall(require, "metals")
if (not status) then return function() end end

return function(on_attach)
    metals_config = metals.bare_config()
    metals_config.init_options.statusBarProvider = "on"
    metals_config.settings = { showImplicitArguments = true }
    metals_config.on_attach = on_attach
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()


    vim.cmd [[augroup lsp]]
    vim.cmd [[au!]]
    vim.cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
    vim.cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
    vim.cmd [[augroup end]]

    return metals_config
end
