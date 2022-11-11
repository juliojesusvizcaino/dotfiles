local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")

telescope.load_extension('fzf')

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}
