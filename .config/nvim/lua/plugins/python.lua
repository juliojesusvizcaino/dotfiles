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
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --   },
  --   opts = function(_, opts)
  --     local compare = require("cmp.config.compare")
  --     compare.python_var = function(entry1, entry2)
  --       if vim.o.filetype ~= "python" then
  --         return
  --       end
  --       -- needed because cmp sometimes gives you the same entry and you must return nil in that case
  --       if entry1:get_completion_item().label == entry2:get_completion_item().label then
  --         return
  --       end
  --       if entry1:get_completion_item().label:match("%w*=") then
  --         -- return true to pick entry1 over entry2
  --         return true
  --       end
  --     end
  --     opts.sorting = {
  --       comparators = compare,
  --     }
  --   end,
  -- },
}
