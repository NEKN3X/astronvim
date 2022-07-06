-- https://nvchad.github.io/config/Custom%20config
local M = {}

M.override = {
  ["kyazdani42/nvim-tree.lua"] = require "custom.plugins.overrides.nvim-tree",
  ["goolord/alpha-nvim"] = require "custom.plugins.overrides.alpha",
  ["nvim-telescope/telescope.nvim"] = require "custom.plugins.overrides.telescope",
  ["hrsh7th/nvim-cmp"] = require "custom.plugins.overrides.cmp",
}

M.user = {
  ["goolord/alpha-nvim"] = { disable = false },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.users.null-ls"
    end,
  },
  ["jose-elias-alvarez/typescript.nvim"] = {},
  ["github/copilot.vim"] = {},
  ["tami5/lspsaga.nvim"] = {
    config = function()
      require "custom.plugins.users.lspsaga"
    end,
  },
  ["windwp/nvim-ts-autotag"] = {
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}

M.options = {
  lspconfig = {
    setup_lspconf = "custom.plugins.options.lspconfig",
  },
}

return M
