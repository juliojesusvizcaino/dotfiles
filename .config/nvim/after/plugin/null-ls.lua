local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.mypy,
		-- null.builtins.completion.spell, -- too many text results
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.code_actions.shellcheck,
	},
})
