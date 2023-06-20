---@type LazyConfig
return {
  {
    "stevearc/oil.nvim",
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "-",
        function()
          require("oil").open()
        end,
        mode = { "n" },
        desc = "Open parent directory",
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      { "<leader>.", "<cmd>Telescope file_browser path=%:p:h<CR>", desc = "Browse files" },
    },
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        opts = {
          extensions = {
            file_browser = {
              -- disables netrw and use telescope-file-browser in its place
              hijack_netrw = true,
              hidden = true,
            },
          },
        },
      },
    },
  },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   config = function()
  --     print("something")
  --     print(vim.inspect(require("telescope").extensions))
  --     -- = {
  --     --   file_browser = {
  --     --     theme = "tokyonight",
  --     --     hijack_netrw = true,
  --     --     hidden = true,
  --     --   },
  --     -- }
  --     local a, b = pcall(require, "telescope")
  --     print("arst")
  --     print(vim.inspect(a))
  --     print("qwfp")
  --     print(vim.inspect(b))
  --     local c, d = pcall(require("telescope"), "load_extension")
  --     print("arst")
  --     print(vim.inspect(c))
  --     -- print("qwfp")
  --     -- print(vim.inspect(d))
  --     -- require("telescope").load_extension("file_browser")
  --     pcall(require("telescope").load_extension, "file_browser")
  --   end,
  --   keys = {
  --     { "<leader>.", "<cmd>Telescope file_browser path=%:p:h<CR>", desc = "Browse files" },
  --   },
  --   -- dependencies = {
  --   --   {
  --   --     "nvim-telescope/telescope.nvim",
  --   --     opts = {
  --   --       extensions = {
  --   --         file_browser = {
  --   --
  --   --           theme = "tokyonight",
  --   --           hijack_netrw = true,
  --   --           hidden = true,
  --   --         },
  --   --       },
  --   --     },
  --   --     --   function(_, opts)
  --   --     --   opts.extensions = opts.extensions or {}
  --   --     --   opts.extensions.file_browser = {
  --   --     --     -- disables netrw and use telescope-file-browser in its place
  --   --     --     theme = "tokyonight",
  --   --     --     hijack_netrw = true,
  --   --     --     hidden = true,
  --   --     --   }
  --   --     -- end,
  --   --   },
  --   -- },
  -- },
}
