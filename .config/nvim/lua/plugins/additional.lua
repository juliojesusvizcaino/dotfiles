return {
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000",
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = true,
	},
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = true,
	},
	{ "ThePrimeagen/harpoon", dependencies = "nvim-lua/plenary.nvim" },
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = "<a-space>",
			})
		end,
	},
	{
		"AckslD/nvim-pytrize.lua",
		config = true,
	},

	"ThePrimeagen/vim-be-good",
	"jose-elias-alvarez/typescript.nvim",
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		dependencies = { "kkharji/sqlite.lua" },
	},
	"jose-elias-alvarez/null-ls.nvim",
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{ "knubie/vim-kitty-navigator", build = "cp ./*.py ~/.config/kitty/" },
	{
		"klen/nvim-test",
		opts = {
			term = "toggleterm",
		},
	},
	"emmanueltouzery/agitator.nvim",
	"eandrju/cellular-automaton.nvim",
	"rafamadriz/friendly-snippets",
}
