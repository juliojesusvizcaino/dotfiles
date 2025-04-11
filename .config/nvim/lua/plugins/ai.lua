return {
  -- temporal fix: https://github.com/LazyVim/LazyVim/issues/5905
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = function()
      require("copilot.api").status = require("copilot.status")
    end,
  },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = "gemini",
  --     -- auto_suggestions_provider = "gemini",
  --     copilot = {
  --       model = "claude-3.5-sonnet",
  --       temperature = 0,
  --       max_tokens = 8192,
  --     },
  --     gemini = {
  --       endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
  --       model = "gemini-2.5-pro-exp-03-25", -- gemini-2.0-flash
  --       timeout = 300000, -- Timeout in milliseconds
  --       temperature = 0,
  --       max_tokens = 8192,
  --     },
  --     openai = {
  --       endpoint = "https://api.openai.com/v1",
  --       model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
  --       timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
  --       temperature = 0,
  --       max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --       --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --     },
  --     file_selector = {
  --       --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
  --       provider = "snacks",
  --       -- Options override for custom providers
  --       provider_opts = {},
  --     },
  --     rag_service = {
  --       enabled = false, -- Enables the RAG service
  --       host_mount = os.getenv("HOME"), -- Host mount path for the rag service
  --       provider = "ollama", -- The provider to use for RAG service (e.g. openai or ollama)
  --       llm_model = "llama3", -- The LLM model to use for RAG service
  --       embed_model = "nomic-embed-text", -- The embedding model to use for RAG service
  --       -- ssh -L 11434:ordenadoraco.local:11434 julio@ordenadoraco.local
  --       endpoint = "http://localhost:11434", -- The API endpoint for RAG service
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     {
  --       optional = true,
  --       "saghen/blink.cmp",
  --       dependencies = {
  --         "Kaiser-Yang/blink-cmp-avante",
  --         -- ... Other dependencies
  --       },
  --       opts = {
  --         sources = {
  --           -- Add 'avante' to the list
  --           default = { "avante", "lsp", "path", "snippets", "buffer" },
  --           providers = {
  --             avante = {
  --               module = "blink-cmp-avante",
  --               name = "Avante",
  --               opts = {
  --                 -- options for blink-cmp-avante
  --               },
  --             },
  --           },
  --         },
  --       },
  --     },
  --     --- The below dependencies are optional,
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionCmd", "CodeCompanionActions" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "codecompanion" },
        },
        ft = { "markdown", "codecompanion" },
      },
      {
        "Davidyz/VectorCode",
        version = "*", -- optional, depending on whether you're on nightly or release
        build = "uv tool upgrade vectorcode", -- optional but recommended if you set `version = "*"`
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    opts = {
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-3.5-sonnet",
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "copilot",
          slash_commands = {
            ["file"] = {
              -- Location to the slash command in CodeCompanion
              callback = "strategies.chat.slash_commands.file",
              description = "Select a file using Snacks",
              opts = {
                provider = "snacks",
                contains_code = true,
              },
            },
            codebase = {
              callback = function()
                return require("vectorcode.integrations").codecompanion.chat.make_slash_command()
              end,
              description = "Run VectorCode to retrieve the project context.",
            },
          },
          tools = {
            vectorcode = {
              description = "Run VectorCode to retrieve the project context.",
              callback = function()
                return require("vectorcode.integrations").codecompanion.chat.make_tool()
              end,
            },
            mcp = {
              -- calling it in a function would prevent mcphub from being loaded before it's needed
              callback = function()
                return require("mcphub.extensions.codecompanion")
              end,
              description = "Call tools and resources from the MCP Servers",
              opts = {
                requires_approval = true,
              },
            },
          },
        },
        inline = {
          adapter = "copilot",
        },
      },
      -- display = {
      --   diff = {
      --     enabled = true,
      --     close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
      --     layout = "vertical", -- vertical|horizontal split for default provider
      --     opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
      --     provider = "mini_diff", -- default|mini_diff
      --   },
      -- },
    },
    keys = {
      { "<leader>a", desc = "CodeCompanion" },
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle Chat" },
      { "<leader>ap", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Actions" },
      { "<leader>ac", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Chat Add" },
    },
    init = function()
      vim.cmd([[cab cc CodeCompanion]])
    end,
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    cmd = "MCPHub", -- lazily start the hub when `MCPHub` is called
    build = "mise use npm:mcp-hub@latest --global", -- Installs required mcp-hub npm module
    config = function()
      require("mcphub").setup({
        -- Required options
        port = 3333, -- Port for MCP Hub server
        config = vim.fn.expand("~/.config/mcphub/mcpservers.json"), -- Absolute path to config file

        -- Optional options
        on_ready = function(hub)
          -- Called when hub is ready
        end,
        on_error = function(err)
          -- Called on errors
        end,
        log = {
          level = vim.log.levels.WARN,
          to_file = false,
          file_path = nil,
          prefix = "MCPHub",
        },
      })
    end,
  },
}
-- return {
--   -- {
--   --   "yetone/avante.nvim",
--   --   event = "VeryLazy",
--   --   lazy = false,
--   --   version = false, -- set this if you want to always pull the latest change
--   --   -- error with copilot
--   --   -- commit = "fb7567ac242fcd0e6013c9a2e735840a3d6fb2fe",
--   --   opts = {
--   --     provider = "copilot", -- Only recommend using Claude
--   --     copilot = {
--   --       model = "claude-3.5-sonnet",
--   --     },
--   --     file_selector = {
--   --       --- "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
--   --       provider = "snacks",
--   --       -- Options override for custom providers
--   --       provider_opts = {},
--   --     },
--   --     -- provider = "azure", -- Only recommend using Claude
--   --     -- azure = {
--   --     --   endpoint = "https://nucleoo-ai-us.openai.azure.com/", -- example: "https://<your-resource-name>.openai.azure.com"
--   --     --   deployment = "nucleoo-aiaiai-4o", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
--   --     -- },
--   --     -- auto_suggestions_provider = "copilot",
--   --     behaviour = {
--   --       --- ... existing behaviours
--   --       enable_cursor_planning_mode = true, -- enable cursor planning mode!
--   --     },
--   --     silent_warning = false, -- Add the missing field
--   --     dual_boost = {
--   --       enabled = false,
--   --       first_provider = "azure",
--   --       second_provider = "claude",
--   --       prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
--   --       timeout = 60000, -- Timeout in milliseconds
--   --     },
--   --     -- rag_service = {
--   --     --   enabled = true, -- Enables the rag service, requires OPENAI_API_KEY to be set
--   --     -- },
--   --   },
--   --   keys = {
--   --     {
--   --       "<leader>aa",
--   --       function()
--   --         require("avante.api").ask()
--   --       end,
--   --       desc = "avante: ask",
--   --       mode = { "n", "v" },
--   --     },
--   --     {
--   --       "<leader>ar",
--   --       function()
--   --         require("avante.api").refresh()
--   --       end,
--   --       desc = "avante: refresh",
--   --     },
--   --     {
--   --       "<leader>ae",
--   --       function()
--   --         require("avante.api").edit()
--   --       end,
--   --       desc = "avante: edit",
--   --       mode = "v",
--   --     },
--   --   },
--   --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--   --   build = "make",
--   --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--   --   dependencies = {
--   --     "nvim-treesitter/nvim-treesitter",
--   --     "stevearc/dressing.nvim",
--   --     "nvim-lua/plenary.nvim",
--   --     "MunifTanjim/nui.nvim",
--   --     --- The below dependencies are optional,
--   --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--   --     "zbirenbaum/copilot.lua", -- for providers='copilot'
--   --     {
--   --       -- support for image pasting
--   --       "HakonHarnes/img-clip.nvim",
--   --       event = "VeryLazy",
--   --       opts = {
--   --         -- recommended settings
--   --         default = {
--   --           embed_image_as_base64 = false,
--   --           prompt_for_file_name = false,
--   --           drag_and_drop = {
--   --             insert_mode = true,
--   --           },
--   --           -- required for Windows users
--   --           use_absolute_path = true,
--   --         },
--   --       },
--   --     },
--   --     {
--   --       -- Make sure to set this up properly if you have lazy=true
--   --       "MeanderingProgrammer/render-markdown.nvim",
--   --       opts = {
--   --         file_types = { "markdown", "Avante" },
--   --       },
--   --       ft = { "markdown", "Avante" },
--   --     },
--   --   },
--   -- },
--   -- {
--   --   "saghen/blink.cmp",
--   --   optional = true,
--   --   dependencies = {
--   --     "giuxtaposition/blink-cmp-copilot",
--   --   },
--   --   opts = {
--   --     sources = {
--   --       providers = {
--   --         copilot = {
--   --           score_offset = 0,
--   --         },
--   --       },
--   --     },
--   --   },
--   -- },
--   -- {
--   --   "saghen/blink.cmp",
--   --   optional = true,
--   --   dependencies = {
--   --     "Kaiser-Yang/blink-cmp-avante",
--   --   },
--   --   opts = {
--   --     sources = {
--   --       -- Add 'avante' to the list
--   --       default = {
--   --         "avante",
--   --         "lsp",
--   --         "path",
--   --         "luasnip",
--   --         "buffer",
--   --       },
--   --       providers = {
--   --         avante = {
--   --           module = "blink-cmp-avante",
--   --           name = "Avante",
--   --           opts = {
--   --             -- options for blink-cmp-avante
--   --           },
--   --         },
--   --       },
--   --     },
--   --   },
--   -- },
--   {
--     "yetone/avante.nvim",
--     lazy = true,
--     event = "VeryLazy",
--     build = "make",
--     opts = {
--       provider = "gemini",
--       auto_suggestions_provider = "gemini",
--       copilot = {
--         model = "claude-3.5-sonnet",
--         temperature = 0,
--         max_tokens = 8192,
--       },
--       gemini = {
--         endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
--         model = "gemini-2.0-pro-exp-02-05",  -- gemini-2.0-flash
--         timeout = 30000, -- Timeout in milliseconds
--         temperature = 0,
--         max_tokens = 8192,
--       },
--       hints = { enabled = false },
--       file_selector = {
--         provider = "snacks",
--         provider_opts = {},
--       },
--       -- rag_service = {
--       --   enabled = true, -- Enables the rag service, requires OPENAI_API_KEY to be set
--       -- },
--       --
--       behaviour = {
--         enable_cursor_planning_mode = true, -- enable cursor planning mode!
--         auto_suggestions = true,
--       },
--       -- cursor_applying_provider = "groq", -- In this example, use Groq for applying, but you can also use any provider you want.
--       -- vendors = {
--       --   groq = { -- define groq provider
--       --     __inherited_from = "openai",
--       --     api_key_name = "GROQ_API_KEY",
--       --     endpoint = "https://api.groq.com/openai/v1/",
--       --     model = "llama-3.3-70b-versatile",
--       --     max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
--       --   },
--       -- },
--     },
--     dependencies = {
--       {
--         "MeanderingProgrammer/render-markdown.nvim",
--         ft = function(_, ft)
--           vim.list_extend(ft, { "Avante" })
--         end,
--       },
--       {
--         "folke/which-key.nvim",
--         opts = {
--           spec = {
--             { "<leader>a", group = "ai" },
--           },
--         },
--       },
--     },
--   },
--
--   {
--     "stevearc/dressing.nvim",
--     lazy = true,
--     opts = {
--       input = { enabled = false },
--       select = { enabled = false },
--     },
--   },
--
--   {
--     "saghen/blink.compat",
--     lazy = true,
--     opts = {},
--     config = function()
--       -- monkeypatch cmp.ConfirmBehavior for Avante
--       require("cmp").ConfirmBehavior = {
--         Insert = "insert",
--         Replace = "replace",
--       }
--     end,
--   },
--
--   {
--     "saghen/blink.cmp",
--     lazy = true,
--     opts = {
--       sources = {
--         default = { "avante_commands", "avante_mentions", "avante_files" },
--         providers = {
--           avante_commands = {
--             name = "avante_commands",
--             module = "blink.compat.source",
--             score_offset = 90, -- show at a higher priority than lsp
--             opts = {},
--           },
--           avante_files = {
--             name = "avante_files",
--             module = "blink.compat.source",
--             score_offset = 100, -- show at a higher priority than lsp
--             opts = {},
--           },
--           avante_mentions = {
--             name = "avante_mentions",
--             module = "blink.compat.source",
--             score_offset = 1000, -- show at a higher priority than lsp
--             opts = {},
--           },
--         },
--       },
--     },
--   },
-- }
-- return {
--   -- {
--   --   "yetone/avante.nvim",
--   --   event = "VeryLazy",
--   --   lazy = false,
--   --   version = false, -- set this if you want to always pull the latest change
--   --   -- error with copilot
--   --   -- commit = "fb7567ac242fcd0e6013c9a2e735840a3d6fb2fe",
--   --   opts = {
--   --     provider = "copilot", -- Only recommend using Claude
--   --     copilot = {
--   --       model = "claude-3.5-sonnet",
--   --     },
--   --     file_selector = {
--   --       --- "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
--   --       provider = "snacks",
--   --       -- Options override for custom providers
--   --       provider_opts = {},
--   --     },
--   --     -- provider = "azure", -- Only recommend using Claude
--   --     -- azure = {
--   --     --   endpoint = "https://nucleoo-ai-us.openai.azure.com/", -- example: "https://<your-resource-name>.openai.azure.com"
--   --     --   deployment = "nucleoo-aiaiai-4o", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
--   --     -- },
--   --     -- auto_suggestions_provider = "copilot",
--   --     behaviour = {
--   --       --- ... existing behaviours
--   --       enable_cursor_planning_mode = true, -- enable cursor planning mode!
--   --     },
--   --     silent_warning = false, -- Add the missing field
--   --     dual_boost = {
--   --       enabled = false,
--   --       first_provider = "azure",
--   --       second_provider = "claude",
--   --       prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
--   --       timeout = 60000, -- Timeout in milliseconds
--   --     },
--   --     -- rag_service = {
--   --     --   enabled = true, -- Enables the rag service, requires OPENAI_API_KEY to be set
--   --     -- },
--   --   },
--   --   keys = {
--   --     {
--   --       "<leader>aa",
--   --       function()
--   --         require("avante.api").ask()
--   --       end,
--   --       desc = "avante: ask",
--   --       mode = { "n", "v" },
--   --     },
--   --     {
--   --       "<leader>ar",
--   --       function()
--   --         require("avante.api").refresh()
--   --       end,
--   --       desc = "avante: refresh",
--   --     },
--   --     {
--   --       "<leader>ae",
--   --       function()
--   --         require("avante.api").edit()
--   --       end,
--   --       desc = "avante: edit",
--   --       mode = "v",
--   --     },
--   --   },
--   --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--   --   build = "make",
--   --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--   --   dependencies = {
--   --     "nvim-treesitter/nvim-treesitter",
--   --     "stevearc/dressing.nvim",
--   --     "nvim-lua/plenary.nvim",
--   --     "MunifTanjim/nui.nvim",
--   --     --- The below dependencies are optional,
--   --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--   --     "zbirenbaum/copilot.lua", -- for providers='copilot'
--   --     {
--   --       -- support for image pasting
--   --       "HakonHarnes/img-clip.nvim",
--   --       event = "VeryLazy",
--   --       opts = {
--   --         -- recommended settings
--   --         default = {
--   --           embed_image_as_base64 = false,
--   --           prompt_for_file_name = false,
--   --           drag_and_drop = {
--   --             insert_mode = true,
--   --           },
--   --           -- required for Windows users
--   --           use_absolute_path = true,
--   --         },
--   --       },
--   --     },
--   --     {
--   --       -- Make sure to set this up properly if you have lazy=true
--   --       "MeanderingProgrammer/render-markdown.nvim",
--   --       opts = {
--   --         file_types = { "markdown", "Avante" },
--   --       },
--   --       ft = { "markdown", "Avante" },
--   --     },
--   --   },
--   -- },
--   -- {
--   --   "saghen/blink.cmp",
--   --   optional = true,
--   --   dependencies = {
--   --     "giuxtaposition/blink-cmp-copilot",
--   --   },
--   --   opts = {
--   --     sources = {
--   --       providers = {
--   --         copilot = {
--   --           score_offset = 0,
--   --         },
--   --       },
--   --     },
--   --   },
--   -- },
--   -- {
--   --   "saghen/blink.cmp",
--   --   optional = true,
--   --   dependencies = {
--   --     "Kaiser-Yang/blink-cmp-avante",
--   --   },
--   --   opts = {
--   --     sources = {
--   --       -- Add 'avante' to the list
--   --       default = {
--   --         "avante",
--   --         "lsp",
--   --         "path",
--   --         "luasnip",
--   --         "buffer",
--   --       },
--   --       providers = {
--   --         avante = {
--   --           module = "blink-cmp-avante",
--   --           name = "Avante",
--   --           opts = {
--   --             -- options for blink-cmp-avante
--   --           },
--   --         },
--   --       },
--   --     },
--   --   },
--   -- },
--   {
--     "yetone/avante.nvim",
--     lazy = true,
--     event = "VeryLazy",
--     build = "make",
--     opts = {
--       provider = "gemini",
--       -- auto_suggestions_provider = "copilot",
--       copilot = {
--         model = "claude-3.5-sonnet",
--         temperature = 0,
--         max_tokens = 8192,
--       },
--       gemini = {
--         endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
--         model = "gemini-2.0-pro-exp-02-05",  -- gemini-2.0-flash
--         timeout = 30000, -- Timeout in milliseconds
--         temperature = 0,
--         max_tokens = 8192,
--       },
--       hints = { enabled = false },
--       file_selector = {
--         provider = "snacks",
--         provider_opts = {},
--       },
--       -- rag_service = {
--       --   enabled = true, -- Enables the rag service, requires OPENAI_API_KEY to be set
--       -- },
--       --
--       behaviour = {
--         enable_cursor_planning_mode = true, -- enable cursor planning mode!
--       },
--       -- cursor_applying_provider = "groq", -- In this example, use Groq for applying, but you can also use any provider you want.
--       -- vendors = {
--       --   groq = { -- define groq provider
--       --     __inherited_from = "openai",
--       --     api_key_name = "GROQ_API_KEY",
--       --     endpoint = "https://api.groq.com/openai/v1/",
--       --     model = "llama-3.3-70b-versatile",
--       --     max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
--       --   },
--       -- },
--     },
--     dependencies = {
--       {
--         "MeanderingProgrammer/render-markdown.nvim",
--         ft = function(_, ft)
--           vim.list_extend(ft, { "Avante" })
--         end,
--       },
--       {
--         "folke/which-key.nvim",
--         opts = {
--           spec = {
--             { "<leader>a", group = "ai" },
--           },
--         },
--       },
--     },
--   },
--
--   {
--     "stevearc/dressing.nvim",
--     lazy = true,
--     opts = {
--       input = { enabled = false },
--       select = { enabled = false },
--     },
--   },
--
--   {
--     "saghen/blink.compat",
--     lazy = true,
--     opts = {},
--     config = function()
--       -- monkeypatch cmp.ConfirmBehavior for Avante
--       require("cmp").ConfirmBehavior = {
--         Insert = "insert",
--         Replace = "replace",
--       }
--     end,
--   },
--
--   {
--     "saghen/blink.cmp",
--     lazy = true,
--     opts = {
--       sources = {
--         default = { "avante_commands", "avante_mentions", "avante_files" },
--         providers = {
--           avante_commands = {
--             name = "avante_commands",
--             module = "blink.compat.source",
--             score_offset = 90, -- show at a higher priority than lsp
--             opts = {},
--           },
--           avante_files = {
--             name = "avante_files",
--             module = "blink.compat.source",
--             score_offset = 100, -- show at a higher priority than lsp
--             opts = {},
--           },
--           avante_mentions = {
--             name = "avante_mentions",
--             module = "blink.compat.source",
--             score_offset = 1000, -- show at a higher priority than lsp
--             opts = {},
--           },
--         },
--       },
--     },
--   },
-- }
