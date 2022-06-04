local options = {}

options.defaults = {
  vimgrep_arguments = {
     "rg",
     "--color=never",
     "--no-heading",
     "--with-filename",
     "--line-number",
     "--column",
     "--smart-case",
     "--no-ignore"
  },
}

return options
