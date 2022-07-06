-- https://nvchad.github.io/config/Mappings
local M = {}

local swapBoolean = function()
  local c = vim.api.nvim_get_current_line()
  local subs = c:match "true" and c:gsub("true", "false") or c:gsub("false", "true")

  vim.api.nvim_set_current_line(subs)
end

M.general = {
  n = {
    [",q"] = { ":qa<CR>", "Quit All" },
    [",w"] = { ":w<CR>", "Save file" },
    ["<leader>b"] = { swapBoolean, "Swap Boolean" },
  },
}

M.cmp = {
  i = {},
}

M.telescope = {
  n = {
    ["<leader>ft"] = { "<cmd> Telescope <CR>", "open telescope" },
    ["<leader>ff"] = { "<cmd> Telescope find_files no_ignore=true<CR>", "  find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep no_ignore=true<CR>", "   live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles no_ignore=true<CR>", "   find oldfiles" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },
  },
}

M.lspconfig = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "   lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "   lsp definition",
    },

    ["K"] = {
      "<cmd>Lspsaga hover_doc<CR>",
      "   lsp hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "   lsp implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "   lsp signature_help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "   lsp definition type",
    },

    ["<leader>ra"] = {
      "<cmd>Lspsaga rename<CR>",
      "   lsp rename",
    },

    ["<leader>ca"] = {
      "<cmd>Lspsaga code_action<CR>",
      "   lsp code_action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "   lsp references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "   floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "   goto prev",
    },

    ["d]"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "   goto_next",
    },

    ["<leader>q"] = {
      "<cmd>Lspsaga show_line_diagnostics<CR>",
      "   diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.formatting()
      end,
      "   lsp formatting",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "   add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "   remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "   list workspace folders",
    },
  },
}
return M
