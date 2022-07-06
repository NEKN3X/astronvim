local M = {}

M.setup_lsp = function(attach, capabilities)
  local lsp_installer = require "nvim-lsp-installer"
  local lspconfig = require "lspconfig"
  lsp_installer.setup()

  local attach_format = function(client, bufnr)
    attach(client, bufnr)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.document_range_formatting = true
  end

  for _, server in ipairs(lsp_installer.get_installed_servers()) do
    local config = {
      on_attach = attach,
      capabilities = capabilities,
    }

    if server.name == "sumneko_lua" then
      config = {
        on_attach = attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim",
                "use",
                "describe",
                "it",
                "assert",
                "before_each",
                "after_each",
              },
            },
          },
        },
      }
    end

    if server.name == "prismals" then
      config = {
        on_attach = attach_format,
        capabilities = capabilities,
      }
    end

    if server.name == "solargraph" then
      config = {
        on_attach = attach,
        capabilities = capabilities,
        settings = {
          solargraph = {
            diagnostics = false,
          },
        },
      }
    end

    if server.name == "tsserver" then
      require("typescript").setup {
        server = {
          on_attach = attach,
          capabilities = capabilities,
        },
      }
    else
      lspconfig[server.name].setup(config)
    end
  end
end

return M
