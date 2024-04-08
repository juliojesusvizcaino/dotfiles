---@type LazyConfig
return {
  -- {
  --   "nvimdev/lspsaga.nvim",
  --   config = function()
  --     require("lspsaga").setup({})
  --   end,
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter", -- optional
  --     "nvim-tree/nvim-web-devicons", -- optional
  --   },
  --   event = "LspAttach",
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = true,
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      codelens = {
        enabled = true,
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                -- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
              },
            },
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              },
            },
          },
        },
      },
    },
  },
}
-- I want bordered hover :(
-- ---@type LazyConfig
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = function()
--       vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
--       vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])
--       local border = {
--         { "🭽", "FloatBorder" },
--         { "▔", "FloatBorder" },
--         { "🭾", "FloatBorder" },
--         { "▕", "FloatBorder" },
--         { "🭿", "FloatBorder" },
--         { "▁", "FloatBorder" },
--         { "🭼", "FloatBorder" },
--         { "▏", "FloatBorder" },
--       }
--       local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
--       function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--         print('openning float')
--         opts = opts or {}
--         opts.border = opts.border or border
--         return orig_util_open_floating_preview(contents, syntax, opts, ...)
--       end
--       -- example to setup with typescript.nvim
--       -- tsserver = function(_, opts)
--       --   require("typescript").setup({ server = opts })
--       --   return true
--       -- end,
--       -- Specify * to use this function as a fallback for any server
--       -- ["*"] = function(server, opts) end,
--     end,
--   },
-- }
