---@type LazyConfig
return {
  {
    "emmanueltouzery/agitator.nvim",
    keys = {
      {
        "<leader>g ",
        function()
          return require("agitator").open_file_git_branch
        end,
        desc = "open file in branch",
      },
      {
        "<leader>g/",
        function()
          return require("agitator").search_git_branch
        end,
        desc = "search branch",
      },
      {
        "<leader>gt",
        function()
          return require("agitator").git_time_machine({ use_current_win = false })
        end,
        desc = "time machine",
      },
    },
  },
}
