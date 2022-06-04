local M = {}

M.setup_lsp = function(attach, capabilities)
  local lsp_installer = require("nvim-lsp-installer")

  local lspconfig = require "lspconfig"

  lsp_installer.setup()
  for _, server in ipairs(lsp_installer.get_installed_servers()) do
    local opts = {
      on_attach = attach,
      capabilities = capabilities
    }
    if server.name == "tsserver" then
      opts.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        attach(client, bufnr)
      end
    end

    lspconfig[server.name].setup(opts)
  end
end

return M
