---@type LazyConfig
return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.sources, {
        require("null-ls").builtins.formatting.black.with({
          extra_args = function(_)
            return { "--config", "black.toml" }
          end,
        }),
      })
    end,
  },
}
