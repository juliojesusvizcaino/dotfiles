return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre "
      .. vim.fn.expand("~")
      .. "/Documents/work-brain/work/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/work-brain/work/**.md",
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/Documents/work-brain/work",
      },
    },
  },
  keys = {
    { "<leader>n", desc = "Obsidian (notes)" },
    { "<leader>nt", "<cmd>ObsidianToday<cr>", mode = "n", desc = "Today" },
    { "<leader>nd", "<cmd>ObsidianDailies<cr>", mode = "n", desc = "Dailies" },
    { "<leader>n/", "<cmd>ObsidianSearch<cr>", mode = "n", desc = "Search" },
    { "<leader>n ", "<cmd>ObsidianQuickSwitch<cr>", mode = "n", desc = "Notes" },
  },
  cmd = {
    "ObsidianBacklinks",
    "ObsidianCheck",
    "ObsidianDailies",
    "ObsidianDebug",
    "ObsidianExtractNote",
    "ObsidianFollowLink",
    "ObsidianLink",
    "ObsidianLinkNew",
    "ObsidianNew",
    "ObsidianOpen",
    "ObsidianPasteImg",
    "ObsidianQuickSwitch",
    "ObsidianRename",
    "ObsidianSearch",
    "ObsidianTags",
    "ObsidianTemplate",
    "ObsidianToday",
    "ObsidianTomorrow",
    "ObsidianWorkspace",
    "ObsidianYesterday",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter",
    {
      "epwalsh/pomo.nvim",
      version = "*", -- Recommended, use latest release instead of latest commit
      lazy = true,
      cmd = { "TimerStart", "TimerRepeat" },
      dependencies = {
        -- Optional, but highly recommended if you want to use the "Default" timer
        "rcarriga/nvim-notify",
        {
          "nvim-lualine/lualine.nvim",
          opts = {
            sections = {
              lualine_x = {
                function()
                  local ok, pomo = pcall(require, "pomo")
                  if not ok then
                    return ""
                  end

                  local timer = pomo.get_first_to_finish()
                  if timer == nil then
                    return ""
                  end

                  return "󰄉 " .. tostring(timer)
                end,
                "encoding",
                "fileformat",
                "filetype",
              },
            },
          },
        },
      },
      opts = {},
    },
  },
}
