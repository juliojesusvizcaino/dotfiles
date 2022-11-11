-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("folke/tokyonight.nvim")
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("jose-elias-alvarez/typescript.nvim")
    use("b0o/schemastore.nvim")

    -- completion
    use("hrsh7th/nvim-cmp") -- Autocompletion plugin
    use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })

    use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
    use("L3MON4D3/LuaSnip") -- Snippets plugin

    --    icons
    use({
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    })
    use("onsails/lspkind.nvim")

    -- telescope things
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })
    use("nvim-treesitter/nvim-treesitter-context")
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })

    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = "nvim-lua/plenary.nvim",
    })

    -- git
    use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    })
    -- comments
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.eslint_d,
                    null_ls.builtins.diagnostics.shellcheck,
                    -- null.builtins.completion.spell, -- too many text results
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.code_actions.gitsigns,
                    null_ls.builtins.code_actions.eslint_d,
                    null_ls.builtins.code_actions.shellcheck,
                },
            })
        end,
    })

    use("folke/neodev.nvim")
end)
