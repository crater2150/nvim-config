local status1, mason = pcall(require, "mason")
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not (status1 and status2)) then return end

return function(on_attach)
  mason.setup {}
  mason_lspconfig.setup {
    ensure_installed = { 'jdtls', 'lua_ls' }
  }

  local no_autosetup = {
    jdtls = true
  }

  local extra_config = {
    lua_ls = {
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false },
        },
      },
    }
  }

  mason_lspconfig.setup_handlers {
    function(server_name)
      if (not no_autosetup[server_name]) then
        require("lspconfig")[server_name].setup(
          extra_config[server_name] or { on_attach = on_attach }
        )
      end
    end,
  }
end
