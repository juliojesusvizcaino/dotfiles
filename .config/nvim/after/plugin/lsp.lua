-- install servers automatically
local mason = require("mason")
mason.setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	automatic_installation = true,
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- disabled when using nvim-cmp
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>"--[[ vim.lsp.buf.definition ]], bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>"--[[ vim.lsp.buf.implementation ]], bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set(
		"n",
		"<space>D",
		"<cmd>Telescope lsp_type_definitions<cr>", --[[ vim.lsp.buf.type_definition ]]
		bufopts
	)
	vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>"--[[ vim.lsp.buf.references ]], bufopts)
	vim.keymap.set("n", "<leader>cf", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lspconfig = require("lspconfig")

local config = {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, config)

-- Special server for typescript
require("typescript").setup({
	server = config,
})

-- lspconfig.tsserver.setup {
--     on_attach = on_attach,
--     -- capabilities = capabilities,
-- }

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({})

for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
	if server ~= "tsserver" then
		-- tsserver is already configured by the typescript plugin
		lspconfig[server].setup({})
	elseif server == "jsonls" then
		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})
	end
end
-- lspconfig.pyright.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })
-- lspconfig.angularls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })
--
-- lspconfig.sumneko_lua.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })
--
-- lspconfig.cssls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

local null_ls = require("null-ls")

null_ls.setup({
	-- debug = true,
	on_attach = on_attach,
	sources = {
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.mypy.with({
			timeout = 30000,
		}),
		-- null.builtins.completion.spell, -- too many text results
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.code_actions.shellcheck,
	},
})
