return {
  -- {
  --   "nvim-lspconfig",
  --   opts = {
  --     -- now: vim.g.autoformat = false
  --     -- autoformat = false,
  --     format = {
  --       timeout_ms = 10000,
  --     },
  --   },
  -- },
  -- {
  --   "stevearc/conform.nvim",
  --   optional = true,
  --   opts = {
  --     formatters_by_ft = {
  --       ["javascript"] = { "biome" },
  --       ["javascriptreact"] = { "biome" },
  --       ["typescript"] = { "biome" },
  --       ["typescriptreact"] = { "biome" },
  --       ["vue"] = { "biome" },
  --       ["json"] = { "biome" },
  --       ["jsonc"] = { "biome" },
  --     },
  --   },
  -- },
  --
  -- {
  --   "stevearc/conform.nvim",
  --   dependencies = { "mason.nvim" },
  --   lazy = true,
  --   cmd = "ConformInfo",
  --   opts = {
  --     formatters = { "sql-formatter" },
  --     formatters_by_ft = {
  --       sql = { "sql-formatter" },
  --     },
  --   },
  -- },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sql_formatter" },
      },
      formatters = {
        sql_formatter = {
          command = "sql-formatter",
          args = { "--language", "postgresql" }, -- Add any other arguments you prefer
        },
      },
    },
  },
}
