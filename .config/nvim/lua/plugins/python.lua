---@type LazyConfig
return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    opts = {
      servers = {
        basedpyright = {
          mason = false,
        },
      },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      anaconda_path = "/home/julio/mambaforge/envs/",
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          args = { "--log-level", "DEBUG", "--no-cov" },
          dap = { justMyCode = false },
        },
      },
    },
  },
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters = {
  --       black = {
  --         prepend_args = { "--config", "black.toml" },
  --       },
  --     },
  --   },
  -- },
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
}
