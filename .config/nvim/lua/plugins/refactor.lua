return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    keys = {
      { "<leader>r", desc = "+refactor" },
      {
        "<leader>rr",
        function()
          require("refactoring").select_refactor()
        end,
        noremap = true,
        silent = true,
        expr = false,
        mode = { "v" },
      },
      -- Remaps for the refactoring operations currently offered by the plugin
      {
        "<leader>rf",
        function()
          require("refactoring").refactor("Extract Function")
        end,
        desc = "Extract Function",
        noremap = true,
        silent = true,
        expr = false,
        mode = { "v" },
      },
      {
        "<leader>rF",
        function()
          require("refactoring").refactor("Extract Function To File")
        end,
        desc = "Extract Function To File",
        noremap = true,
        silent = true,
        expr = false,
        mode = { "v" },
      },
      {
        "<leader>rv",
        function()
          require("refactoring").refactor("Extract Variable")
        end,
        desc = "Extract Variable",
        noremap = true,
        silent = true,
        expr = false,
        mode = { "v" },
      },
      {
        "<leader>ri",
        function()
          require("refactoring").refactor("Inline Variable")
        end,
        desc = "Inline Variable",
        noremap = true,
        silent = true,
        expr = false,
        mode = { "v" },
      },
      -- Extract block doesn't need visual mode
      {
        "<leader>rb",
        function()
          require("refactoring").refactor("Extract Block")
        end,
        noremap = true,
        silent = true,
        expr = false,
        mode = { "n" },
      },
      {
        "<leader>rB",
        function()
          require("refactoring").refactor("Extract Block To File")
        end,
        noremap = true,
        silent = true,
        expr = false,
        mode = { "n" },
      },
      -- Inline variable can also pick up the identifier currently under the cursor without visual mode
      {
        "<leader>ri",
        function()
          require("refactoring").refactor("Inline Variable")
        end,
        noremap = true,
        silent = true,
        expr = false,
        mode = { "n" },
      },
    },
  },
}
