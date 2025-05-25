return {
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    keys = {
      { "<leader>uH", "<cmd>Hardtime toggle<cr>", mode = "n", desc = "Toggle hardtime" },
    },
  },
}
