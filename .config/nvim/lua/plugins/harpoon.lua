---@type LazyConfig
return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- LSP keymaps
      {
        "neovim/nvim-lspconfig",
        opts = function()
          local keys = require("lazyvim.plugins.lsp.keymaps").get()
          -- disable a keymap
          keys[#keys + 1] = { "<M-n>", false }
        end,
      },
    },
    keys = {
      {
        "<leader><tab><leader>",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon menu",
      },
      {
        "<leader><tab><tab>",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Harpoon add file",
      },
      {
        "<M-n>",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Harpoon nav file 1",
      },
      {
        "<M-e>",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Harpoon nav file 2",
      },
      {
        "<M-i>",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Harpoon nav file 3",
      },
      {
        "<M-o>",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "Harpoon nav file 4",
      },
      {
        "<leader><tab>n",
        function()
          require("harpoon.mark").set_current_at(1)
        end,
        desc = "Harpoon add file at 1",
      },
      {
        "<leader><tab>e",
        function()
          require("harpoon.mark").set_current_at(2)
        end,
        desc = "Harpoon add file at 2",
      },
      {
        "<leader><tab>i",
        function()
          require("harpoon.mark").set_current_at(3)
        end,
        desc = "Harpoon add file at 3",
      },
      {
        "<leader><tab>o",
        function()
          require("harpoon.mark").set_current_at(4)
        end,
        desc = "Harpoon add file at 4",
      },
    },
  },
}
