---@type LazyConfig
return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
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
        desc = "Harpoon menu",
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
    },
  },
}
