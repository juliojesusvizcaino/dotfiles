---@type LazyConfig
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        -- path_display = { "filename_first" },
      },
      pickers = {
        live_grep = {
          additional_args = { "--hidden" },
          -- path_display = { "smart" },
        },
        grep_string = {
          additional_args = { "--hidden" },
          -- path_display = { "smart" },
        },
        find_files = {
          path_display = {
            "filename_first",
            -- shorten = 3,
          },
        },
        git_files = {
          -- path_display = { "filename_first" },
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
      -- {
      --   "nvim-telescope/telescope-fzf-native.nvim",
      --   build = "make",
      --   config = function()
      --     require("telescope").load_extension("fzf")
      --   end,
      -- },
      --   Error  10:55:36 msg_show.emsg E5108: Error executing lua: ...escope-all-recent.nvim/lua/telescope-all-recent/init.lua:35: attempt to index local 'select_opts' (a nil value)
      {
        "prochri/telescope-all-recent.nvim",
        config = true,
        dependencies = {
          "nvim-telescope/telescope.nvim",
          "kkharji/sqlite.lua",
        },
      },
    },
  },
}
