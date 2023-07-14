---@type LazyConfig
return {
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      anaconda_path = "/home/julio/mambaforge/envs/",
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-python" },
    opts = {
      adapters = {
        ["neotest-python"] = {
          args = { "--log-level", "DEBUG", "--no-cov" },
          dap = { justMyCode = false },
        },
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    opts = {
      handlers = {
        black = function()
          local null_ls = require("null-ls")
          null_ls.register(null_ls.builtins.formatting.black.with({
            timeout = 10000,
            extra_args = function(_)
              return { "--config", "black.toml" }
            end,
          }))
        end,
      },
    },
  },
  {
    "AckslD/nvim-pytrize.lua",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Pytrize", "PytrizeClear", "PytrizeJump", "PytrizeJumpFixture" },
    keys = {
      {
        "gp",
        function()
          require("pytrize.api").jump_fixture()
        end,
        desc = "Goto Fixture",
      },
    },
  },
  -- opts = function(_, opts)
  --   local null_ls = require("null-ls")
  --   -- local h = require("null-ls.helpers")
  --   -- local blackd = {
  --   --   name = "blackd",
  --   --   method = null_ls.methods.FORMATTING,
  --   --   filetypes = { "python" },
  --   --   generator = h.formatter_factory({
  --   --     command = "curl",
  --   --     args = { "localhost:45484", "-s", "-XPOST", "-H", "X-Line-Length: 100", "--data-binary", "@-" },
  --   --     to_stdin = true,
  --   --     timeout = 10000,
  --   --   }),
  --   -- }
  --   opts.handlers = opts.handlers or {}
  --   vim.list_extend(opts.handlers, {
  --     -- blackd,
  --     black = function()
  --       null_ls.register(null_ls.builtins.formatting.black.with({
  --         extra_args = function(_)
  --           return { "--config", "black.toml" }
  --         end,
  --       }))
  --     end,
  --   })
  -- end,
  -- },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   opts = function(_, opts)
  --     local null_ls = require("null-ls")
  --     local h = require("null-ls.helpers")
  --     local blackd = {
  --       name = "blackd",
  --       method = null_ls.methods.FORMATTING,
  --       filetypes = { "python" },
  --       generator = h.formatter_factory({
  --         command = "curl",
  --         args = { "localhost:45484", "-s", "-XPOST", "-H", "X-Line-Length: 100", "--data-binary", "@-" },
  --         to_stdin = true,
  --         timeout = 10000,
  --       }),
  --     }
  --     -- blackd-client doesn't take into account the pyproject.toml config
  --     -- local blackd = {
  --     --   name = "blackd",
  --     --   method = null_ls.methods.FORMATTING,
  --     --   filetypes = { "python" },
  --     --   generator = h.formatter_factory({
  --     --     command = "blackd-client",
  --     --     to_stdin = true,
  --     --     timeout = 3000,
  --     --   }),
  --     -- }
  --     vim.list_extend(opts.sources, {
  --       blackd,
  --       -- null_ls.builtins.formatting.black.with({
  --       --   extra_args = function(_)
  --       --     return { "--config", "black.toml" }
  --       --   end,
  --       -- }),
  --     })
  --   end,
  -- },
}
