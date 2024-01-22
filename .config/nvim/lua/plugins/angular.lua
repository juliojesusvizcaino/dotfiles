return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "angular" })
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter-angular" },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "angular-language-server",
      },
    },
  },
  -- Instead of adding html.angular as a valid filetype for these language servers,
  --   run an autocmd that sets .html files to be just html.
  --   Tailwind fails when adding that additional filetype
  -- {
  --   "neovim/nvim-lspconfig",
  --   ---@class PluginLspOpts
  --   opts = {
  --     servers = {
  --       -- html = {
  --       --   filetypes_include = { "html.angular" },
  --       -- },
  --       -- emmet_ls = {
  --       --   filetypes_include = { "html.angular" },
  --       -- },
  --       -- angularls = {
  --       --   filetypes_include = { "html.angular" },
  --       -- },
  --       tailwindcss = {
  --         -- exclude a filetype from the default_config
  --         -- filetypes_exclude = { "markdown" },
  --         -- add additional filetypes to the default_config
  --         filetypes_include = { "html.angular" },
  --       },
  --     },
  --     -- setup = {
  --     --   html = function(_, opts)
  --     --     local default_config = require("lspconfig.server_configurations.html").default_config
  --     --
  --     --     opts.filetypes = opts.filetypes or {}
  --     --
  --     --     -- Add default filetypes
  --     --     vim.list_extend(opts.filetypes, default_config.filetypes)
  --     --
  --     --     -- Remove excluded filetypes
  --     --     --- @param ft string
  --     --     opts.filetypes = vim.tbl_filter(function(ft)
  --     --       return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
  --     --     end, opts.filetypes)
  --     --
  --     --     -- Add additional filetypes
  --     --     vim.list_extend(opts.filetypes, opts.filetypes_include or {})
  --     --   end,
  --     --   emmet_ls = function(_, opts)
  --     --     local default_config = require("lspconfig.server_configurations.emmet_ls").default_config
  --     --
  --     --     opts.filetypes = opts.filetypes or {}
  --     --
  --     --     -- Add default filetypes
  --     --     vim.list_extend(opts.filetypes, default_config.filetypes)
  --     --
  --     --     -- Remove excluded filetypes
  --     --     --- @param ft string
  --     --     opts.filetypes = vim.tbl_filter(function(ft)
  --     --       return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
  --     --     end, opts.filetypes)
  --     --
  --     --     -- Add additional filetypes
  --     --     vim.list_extend(opts.filetypes, opts.filetypes_include or {})
  --     --   end,
  --     --   angularls = function(_, opts)
  --     --     local default_config = require("lspconfig.server_configurations.angularls").default_config
  --     --
  --     --     opts.filetypes = opts.filetypes or {}
  --     --
  --     --     -- Add default filetypes
  --     --     vim.list_extend(opts.filetypes, default_config.filetypes)
  --     --
  --     --     -- Remove excluded filetypes
  --     --     --- @param ft string
  --     --     opts.filetypes = vim.tbl_filter(function(ft)
  --     --       return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
  --     --     end, opts.filetypes)
  --     --
  --     --     -- Add additional filetypes
  --     --     vim.list_extend(opts.filetypes, opts.filetypes_include or {})
  --     --   end,
  --     -- },
  --   },
  -- },
}
