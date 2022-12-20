return function(config)
  local null_ls = require("null-ls")

  null_ls.setup({
    -- debug = true,
    on_attach = config.on_attach,
    sources = {
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.diagnostics.mypy.with({
        prefer_local = "venv/bin",
        timeout = 30000,
      }),
      null_ls.builtins.diagnostics.flake8.with({
        -- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,

        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = nil
        end,
        -- severities = {
        -- 	[vim.diagnostic.severity.INFO] = vim.diagnostic.severity.INFO,
        -- },
      }),
      -- null.builtins.completion.spell, -- too many text results
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.black.with({
        extra_args = function(_)
          return { "--config", "black.toml" }
        end,
      }),
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.shellharden,
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.code_actions.shellcheck,
    },
  })
end
