local hint = [[
 _n_: step over   _s_: Continue/Start   _b_: Breakpoint     _K_: Eval
 _i_: step into   _x_: Quit             ^ ^                 ^ ^
 _o_: step out    _X_: Stop             ^ ^
 _c_: to cursor   _C_: Close UI
 ^
 ^ ^              _q_: exit
]]

---@type LazyConfig
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "mfussenegger/nvim-dap",
      "anuvyklack/hydra.nvim",
      {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
          require("mason-nvim-dap").setup({
            automatic_setup = true,
          })
          require("mason-nvim-dap").setup_handlers()
        end,
        dependencies = {
          "williamboman/mason.nvim",
          "mfussenegger/nvim-dap",
        },
      },
      {
        "folke/neodev.nvim",
        opts = {
          library = { plugins = { "neotest" }, types = true },
        },
      },
    },
    config = function()
      -- https://github.com/anuvyklack/hydra.nvim/issues/3#issuecomment-1162988750
      local hydra = require("hydra")
      local dap = require("dap")

      local dap_hydra = hydra({
        hint = hint,
        config = {
          color = "pink",
          invoke_on_body = true,
          hint = {
            position = "bottom",
            border = "rounded",
          },
        },
        name = "dap",
        mode = { "n", "x" },
        body = "<leader>dh",
        heads = {
          { "n", dap.step_over, { silent = true } },
          { "i", dap.step_into, { silent = true } },
          { "o", dap.step_out, { silent = true } },
          { "c", dap.run_to_cursor, { silent = true } },
          { "s", dap.continue, { silent = true } },
          { "x", ":lua require'dap'.disconnect({ terminateDebuggee = false })<CR>", { exit = true, silent = true } },
          { "X", dap.close, { silent = true } },
          { "C", ":lua require('dapui').close()<cr>:DapVirtualTextForceRefresh<CR>", { silent = true } },
          { "b", dap.toggle_breakpoint, { silent = true } },
          { "K", ":lua require('dap.ui.widgets').hover()<CR>", { silent = true } },
          { "q", nil, { exit = true, nowait = true } },
        },
      })

      hydra.spawn = function(head)
        if head == "dap-hydra" then
          dap_hydra:activate()
        end
      end

      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            args = { "--log-level", "DEBUG", "--no-cov" },
            dap = { justMyCode = false },
          }),
        },
      })
    end,
    keys = {
      -- Tests
      {
        "<leader>ctt",
        function()
          vim.cmd("wa")
          require("neotest").run.run({ strategy = "dap" })
        end,
        { desc = "dwim" },
      },
      {
        "<leader>ctf",
        function()
          vim.cmd("wa")
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        { desc = "file" },
      },
      {
        "<leader>cts",
        function()
          require("neotest").run.stop()
        end,
        { desc = "stop" },
      },

      -- Debug
      {
        "<leader>odr",
        function()
          require("neotest").run.attach()
        end,
        { desc = "attach repl" },
      },
      {
        "<leader>odo",
        function()
          require("neotest").output.open()
        end,
        { desc = "output" },
      },
      {
        "<leader>odp",
        function()
          require("neotest").output_panel.open()
        end,
        { desc = "panel" },
      },
      {
        "<leader>ods",
        function()
          require("neotest").summary.open()
        end,
        { desc = "summary" },
      },
      {
        "<leader>odh",
        function()
          require("dap").set_breakpoint()
          require("dap").run({ type = "python", request = "attach", host = "127.0.0.1", port = 5678 })
          require("hydra").spawn("dap-hydra")
        end,
        { desc = "Attach hydra" },
      },
    },
  },
}
