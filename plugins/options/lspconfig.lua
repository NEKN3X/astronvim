local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  lspconfig.tsserver.setup {
    on_attach = attach,
    capabilities = capabilities,
  }
end

return M
