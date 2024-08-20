---@type LazyConfig
return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = {
      defaults = {
        -- path_display = { "filename_first" },
      },
      pickers = {
        live_grep = {
          -- additional_args = { "--hidden" },
          -- path_display = { "smart" },
        },
        grep_string = {
          -- additional_args = { "--hidden" },
          -- path_display = { "smart" },
        },
        find_files = {
          path_display = {
            "filename_first",
            -- shorten = 3,
          },
        },
        git_files = {
          path_display = {
            "filename_first",
            -- shorten = 3,
          },
        },
      },
    },
    keys = {
      { "<leader>/", require("telescope.builtin").live_grep, desc = "Find in Files (Grep)" },
      { "<leader>*", require("telescope.builtin").grep_string, desc = "[S]earch current [W]ord" },
      -- { "<leader>h/", require("telescope.builtin").help_tags, desc = "[S]earch [H]elp" },
      -- { "<leader>hk", require("telescope.builtin").keymaps, desc = "[S]earch [H]elp" },
    },
    dependencies = {
      --       {
      --         "nvim-telescope/telescope-fzf-native.nvim",
      --         build = "make",
      --         config = function()
      --           require("telescope").load_extension("fzf")
      --         end,
      --       },
      --       -- {
      --       --   "prochri/telescope-all-recent.nvim",
      --       --   config = true,
      --       --   dependencies = {
      --       --     "nvim-telescope/telescope.nvim",
      --       --     "kkharji/sqlite.lua",
      --       --   },
      --       -- },
    },
  },
  --   -- {
  --   --   "ibhagwan/fzf-lua",
  --   --   optional = true,
  --   --   keys = {
  --   --     { "<leader>*", LazyVim.pick("grep_cword"), desc = "Word (Root Dir)" },
  --   --   },
  --   -- },
}
