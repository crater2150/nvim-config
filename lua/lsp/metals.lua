local status, metals = pcall(require, "metals")
if (not status) then return function() end end

return function(on_attach)
    metals_config = metals.bare_config()
    metals_config.init_options.statusBarProvider = "on"
    metals_config.settings = {
      showImplicitArguments = true,
      superMethodLensesEnabled = true,
    }
    metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()
        on_attach(client, bufnr)
    end
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- Debug settings if you're using nvim-dap
    local dap = require("dap")
    dap.configurations.scala = {
      {
        type = "scala",
        request = "launch",
        name = "RunOrTest",
        metals = {
          runType = "runOrTestFile",
          --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
        },
      },
      {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {
          runType = "testTarget",
        },
      },
    }


    vim.cmd [[augroup lsp]]
    vim.cmd [[au!]]
    vim.cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
    vim.cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
    vim.cmd [[augroup end]]

    return metals_config
end
