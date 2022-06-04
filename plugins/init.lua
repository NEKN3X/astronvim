local M = {}

M.override = {
  ["kyazdani42/nvim-tree.lua"] = require "custom.plugins.overrides.nvim-tree",
  ["goolord/alpha-nvim"] = require "custom.plugins.overrides.alpha",
  ["nvim-telescope/telescope.nvim"] = require "custom.plugins.overrides.telescope",
}

M.user = {
  ["goolord/alpha-nvim"] = { disable = false },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.users.null-ls"
    end,
  },
}

M.options = {
  lspconfig = {
    setup_lspconf = "custom.plugins.options.lspconfig",
  },
}

return M
