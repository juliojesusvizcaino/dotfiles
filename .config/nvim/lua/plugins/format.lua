return {
  {
    "nvim-lspconfig",
    opts = {
      -- now: vim.g.autoformat = false
      -- autoformat = false,
      format = {
        timeout_ms = 10000,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "biome" },
        ["javascriptreact"] = { "biome" },
        ["typescript"] = { "biome" },
        ["typescriptreact"] = { "biome" },
        ["vue"] = { "biome" },
        ["json"] = { "biome" },
        ["jsonc"] = { "biome" },
      },
    },
  },
}
