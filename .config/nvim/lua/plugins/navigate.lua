-- Replaced by flash.nvim
return {
  -- rainbow not working
  -- {
  --   "folke/flash.nvim",
  --   opts = {
  --     label = {
  --       rainbow = {
  --         enabled = true,
  --       }
  --     }
  --   }
  -- }
}
-- return {
--   "ggandor/leap.nvim",
--   keys = {
--     { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
--     { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
--     { "x", mode = { "n", "x", "o" }, desc = "Leap forward to (exclusive)" },
--     { "X", mode = { "n", "x", "o" }, desc = "Leap backward to (exclusive)" },
--     { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
--   },
--   config = function(_, opts)
--     local leap = require("leap")
--     for k, v in pairs(opts) do
--       leap.opts[k] = v
--     end
--     leap.add_default_mappings(true)
--     -- vim.keymap.del({ "x", "o" }, "x")
--     -- vim.keymap.del({ "x", "o" }, "X")
--   end,
-- }