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
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>"--[[ vim.lsp.buf.definition ]] , bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>"--[[ vim.lsp.buf.implementation ]] , bufopts)
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
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>"--[[ vim.lsp.buf.references ]] , bufopts)
    vim.keymap.set("n", "<leader>cf", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lspconfig = require("lspconfig")

local config = {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, config)

-- Special server for typescript
require("typescript").setup({
    server = config,
})

-- lspconfig.tsserver.setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     -- capabilities = capabilities,
-- }

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({})

for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
    -- tsserver is already configured by the typescript plugin
    if server ~= "tsserver" then
        lspconfig[server].setup({})
    end
end
-- lspconfig.pyright.setup({
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- })
-- lspconfig.angularls.setup({
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- })
--
-- lspconfig.sumneko_lua.setup({
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- })
--
-- lspconfig.cssls.setup({
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
-- })
