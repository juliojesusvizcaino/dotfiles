---@type LazyConfig
return {
  {
    "petertriho/cmp-git",
    opts = {
      gitlab = {
        hosts = { "hub.nucleoo.com" },
      },
    },
  },
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
  {
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("gitlinker").setup({
        mappings = nil,
        callbacks = {
          ["hub.nucleoo.com"] = function(url_data)
            return require("gitlinker.hosts").get_gitlab_type_url(url_data)
          end,
        },
      })
    end,
    keys = {
      { "<leader>go", desc = "+open" },
      {
        "<leader>goo",
        function()
          require("gitlinker").get_buf_range_url(
            "v",
            { action_callback = require("gitlinker.actions").open_in_browser }
          )
        end,
        desc = "Browse file",
        silent = true,
        mode = { "n", "v" },
      },
      {
        "<leader>goh",
        function()
          require("gitlinker").get_repo_url({
            action_callback = require("gitlinker.actions").open_in_browser,
          })
        end,
        desc = "Browse homepage",
      },
      {
        "<leader>goy",
        function()
          require("gitlinker").get_buf_range_url()
        end,
        desc = "Copy link to remote",
      },
      {
        "<leader>goY",
        function()
          require("gitlinker").get_repo_url()
        end,
        desc = "Copy link to homepage",
      },
    },
  },
}
