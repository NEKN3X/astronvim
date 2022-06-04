local M = {}

M.override = {}

M.user = {
  ["goolord/alpha-nvim"] = {
    disable = false,
    config  = function()
      require "custom.plugins.users.alpha"
    end
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.users.null-ls"
    end
  }
}

M.options = {
  lspconfig = {
    setup_lspconf = "custom.plugins.options.lspconfig"
  }
}

return M
