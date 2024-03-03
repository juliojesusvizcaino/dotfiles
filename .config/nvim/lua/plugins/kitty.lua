-- Disable default keybindings <c-hjkl> for navigating between splits
vim.g.kitty_navigator_no_mappings = 1
return {
  "fladson/vim-kitty",
  {
    "knubie/vim-kitty-navigator",
    run = "cp ./*.py ~/.config/kitty/",
    keys = {
      { "<M-h>", "<cmd>KittyNavigateLeft<cr>", mode = "n", desc = "Go to left window" },
      { "<M-j>", "<cmd>KittyNavigateDown<cr>", mode = "n", desc = "Go to lower window" },
      { "<M-k>", "<cmd>KittyNavigateUp<cr>", mode = "n", desc = "Go to upper window" },
      { "<M-l>", "<cmd>KittyNavigateRight<cr>", mode = "n", desc = "Go to right window" },
    },
  },
}
