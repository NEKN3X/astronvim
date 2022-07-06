local null_ls = require "null-ls"
local b = null_ls.builtins

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  sources = {
    b.code_actions.eslint_d.with {
      env = {
        ESLINT_D_LOCAL_ESLINT_ONLY = 1,
      },
    },
    b.diagnostics.eslint_d.with {
      env = {
        ESLINT_D_LOCAL_ESLINT_ONLY = 1,
      },
    },
    b.formatting.eslint_d.with {
      env = {
        ESLINT_D_LOCAL_ESLINT_ONLY = 1,
      },
    },
    b.formatting.prettierd.with {
      env = {
        PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
      },
    },
    b.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}
