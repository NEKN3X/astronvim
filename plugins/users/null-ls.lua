local null_ls = require "null-ls"
local builtins = null_ls.builtins
local formatting = builtins.formatting

null_ls.setup {
  sources = {
    formatting.prettier
  }
}
