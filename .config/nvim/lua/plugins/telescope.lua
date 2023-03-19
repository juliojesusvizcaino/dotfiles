---@type LazyConfig
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        live_grep = {
          additional_args = { "--hidden" },
        },
        grep_string = {
          additional_args = { "--hidden" },
        },
      },
    },
    keys = {
      { "<leader>/", require("telescope.builtin").live_grep, desc = "Find in Files (Grep)" },
      { "<leader>*", require("telescope.builtin").grep_string, desc = "[S]earch current [W]ord" },
      { "<leader>h/", require("telescope.builtin").help_tags, desc = "[S]earch [H]elp" },
      { "<leader>hk", require("telescope.builtin").keymaps, desc = "[S]earch [H]elp" },
    },
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "prochri/telescope-all-recent.nvim",
        config = true,
        dependencies = {
          "kkharji/sqlite.lua",
        },
      },
    },
  },
}
