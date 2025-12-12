-- if true then
--   return {
--     {
--       "catppuccin/nvim",
--       lazy = true,
--       name = "catppuccin",
--       opts = {
--         flavour = "mocha",
--         transparent_background = true,
--       },
--     },
--     {
--       "LazyVim/LazyVim",
--       opts = {
--         colorscheme = "catppuccin",
--       },
--     },
--   }
-- end
---@type LazyConfig
return {
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
  -- {
  --   "nvim-notify",
  --   opts = {
  --     background_colour = "#000000",
  --   },
  -- },
  {
    -- https://github.com/LazyVim/LazyVim/issues/6355
    tag = "v1.10.0",
    "catppuccin",
    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      -- transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
