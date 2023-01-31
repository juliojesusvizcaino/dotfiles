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
	"emmanueltouzery/agitator.nvim",
	"eandrju/cellular-automaton.nvim",
	"rafamadriz/friendly-snippets",
	{
		"jayp0521/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						args = { "--log-level", "DEBUG", "--no-cov" },
						dap = { justMyCode = false },
					}),
				},
			})
		end,
	},
	"anuvyklack/hydra.nvim",
	{ "windwp/nvim-autopairs", config = true },
	{ "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim" },
	{
		"ruifm/gitlinker.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("gitlinker").setup({
				mappings = nil,
				callbacks = {
					["code.earth.planet.com"] = function(url_data)
						url_data.host = "hello.planet.com/code"
						local a = require("gitlinker.hosts").get_gitlab_type_url(url_data)
						print(a)
						return a
					end,
				},
			})
		end,
	},
}
