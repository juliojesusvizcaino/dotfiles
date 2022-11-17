-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

-- local filenamee = ".config/nvim/lua/trufas/packer.lua"
-- local path = require('plenary.path'):new(filenamee)
-- print("the filename is", filenamee, "and the path", path)
-- print("some path: ", path:make_relative())

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
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({
		"nvim-telescope/telescope-frecency.nvim",
		requires = { "kkharji/sqlite.lua" },
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = "nvim-lua/plenary.nvim",
	})

	-- git
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
	})
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("emmanueltouzery/agitator.nvim")

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

	use("jose-elias-alvarez/null-ls.nvim")

	use("folke/neodev.nvim")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty/" })
	use({
		"klen/nvim-test",
		config = function()
			require("nvim-test").setup({
                term = "toggleterm",
            })
			-- require("nvim-test.runners.pytest"):setup({
			-- 	find_files = function(filename)
			-- 		local path = require("plenary.path"):new(filename)
			-- 		print("the filename is...", filename, "and the path", path)
			-- 	end, -- find testfile for a file
			-- })
		end,
	})
	use({
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers", -- This is the important bit!
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					-- ["core.gtd.base"] = {},  -- requires a workspace https://github.com/nvim-neorg/neorg/wiki/Getting-Things-Done
				},
			})
		end,
		requires = "nvim-lua/plenary.nvim",
	})
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	})
	use("rafcamlet/nvim-luapad")

	use({ "ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim" })
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = "<c-space>",
			})
		end,
	})
end)
