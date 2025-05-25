return {
  -- Make sure nvim-dap and dap-python are listed if you manage them explicitly
  -- If they are part of a LazyVim 'extra', this might be automatic.
  -- {
  --   "mfussenegger/nvim-dap",
  --   opts = function(_, opts)
  --     -- Ensure the configurations table exists for python
  --     opts.configurations = opts.configurations or {}
  --     opts.configurations.python = opts.configurations.python or {}
  --
  --     -- Add your custom attach configuration
  --     table.insert(opts.configurations.python, {
  --       type = "python", -- This links to the dap-python adapter
  --       request = "attach",
  --       name = "Attach to Port 5678", -- A descriptive name for the menu
  --       connect = {
  --         host = "127.0.0.1", -- Host where the debug server is running (usually localhost)
  --         port = 5678, -- The port your process is listening on
  --       },
  --       pathMappings = { -- IMPORTANT: Adjust if necessary!
  --         {
  --           -- Path to your project root on the machine running Neovim
  --           localPath = vim.fn.getcwd(), -- Use current working directory as a default
  --           -- Path to the project root AS SEEN BY the Python process
  --           -- If running locally without containers/VMs, '.' often works.
  --           -- If in Docker, this might be '/app' or '/code', etc.
  --           remotePath = ".",
  --         },
  --       },
  --       justMyCode = true, -- Set to false if you need to step into library code
  --     })
  --     return opts
  --   end,
  -- },
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
