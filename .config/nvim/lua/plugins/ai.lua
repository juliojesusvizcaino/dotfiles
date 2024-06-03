---@type LazyConfig
return {
  {
    "Exafunction/codeium.nvim",
    opts = {
      enable_chat = true,
      enable_local_search = true,
      enable_index_service = true,
      -- tools = {
      --   language_server = "/home/julio/.local/lib/language_server_linux_x64",
      -- },
    },
    keys = {
      { "<leader>cx", "<cmd>Codeium Chat<cr>", desc = "Codeium - Chat", mode = { "n", "v" } },
    },
    cmd = { "Codeium" },
    lazy = false,
  },
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "BufEnter",
  --   -- disabled in options.lua
  --   -- setup = function()
  --   --   vim.g.codeium_enabled = false
  --   -- end,
  --   keys = {
  --     { "<leader>cx", "<cmd>call codeium#Chat()<cr>", desc = "Codeium - Chat", mode = { "n", "v" } },
  --   },
  -- },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "canary",
  --   dependencies = {
  --     "zbirenbaum/copilot.lua", -- or github/copilot.vim
  --     "nvim-lua/plenary.nvim", -- for curl, log wrapper
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   opts = {
  --     -- debug = true, -- Enable debugging
  --     -- See Configuration section for rest
  --     context = "buffers",
  --   },
  --   lazy = false,
  --   -- See Commands section for default commands if you want to lazy load on them
  --   keys = {
  --     -- Show help actions with telescope
  --     {
  --       "<leader>czh",
  --       function()
  --         local actions = require("CopilotChat.actions")
  --         require("CopilotChat.integrations.telescope").pick(actions.help_actions())
  --       end,
  --       desc = "CopilotChat - Help actions",
  --       mode = { "n", "v" },
  --     },
  --     -- Show prompts actions with telescope
  --     {
  --       "<leader>czp",
  --       function()
  --         local actions = require("CopilotChat.actions")
  --         require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
  --       end,
  --       desc = "CopilotChat - Prompt actions",
  --       mode = { "n", "v" },
  --     },
  --   },
  -- },
  -- You exceeded your current quota :shrug:
  --   you need to pay
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   commit = "62443c9eb261e641d20af143357b157e3f542bb5",
  --   config = function()
  --     require("chatgpt").setup({
  --       api_key_cmd = "pass show openai-nucleoo",
  --       -- api_host_cmd = "echo -n 'api.openai.com'",
  --     })
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
}
