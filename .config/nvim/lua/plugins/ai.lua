---@type LazyVimConfig
return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    ---@type avante.Config
    opts = {
      provider = "copilot", -- Only recommend using Claude
      silent_warning = false, -- Add the missing field
    },
    keys = {
      {
        "<leader>aa",
        function()
          require("avante.api").ask()
        end,
        desc = "avante: ask",
        mode = { "n", "v" },
      },
      {
        "<leader>ar",
        function()
          require("avante.api").refresh()
        end,
        desc = "avante: refresh",
      },
      {
        "<leader>ae",
        function()
          require("avante.api").edit()
        end,
        desc = "avante: edit",
        mode = "v",
      },
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to setup it properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     -- codeium
  --     {
  --       "Exafunction/codeium.nvim",
  --       cmd = "Codeium",
  --       build = ":Codeium Auth",
  --       opts = {},
  --     },
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     for _, source in ipairs(opts.sources) do
  --       if source.name == "codeium" then
  --         source.priority = 1
  --       end
  --     end
  --   end,
  -- },
  -- {
  --   "Exafunction/codeium.nvim",
  --   opts = {
  --     enable_chat = true,
  --     enable_local_search = true,
  --     enable_index_service = true,
  --     -- tools = {
  --     --   language_server = "/home/julio/.local/lib/language_server_linux_x64",
  --     -- },
  --   },
  --   keys = {
  --     { "<leader>cx", "<cmd>Codeium Chat<cr>", desc = "Codeium - Chat", mode = { "n", "v" } },
  --   },
  --   cmd = { "Codeium" },
  --   lazy = false,
  -- },
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = {
      panel = { enabled = true },
    },
  },
}
