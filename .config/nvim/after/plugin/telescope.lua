local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
	extensions = {
		file_browser = {
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			hidden = true,
		},
		frecency = {
			default_workspace = "CWD",
			show_unindexed = false,
			workspaces = {
				["dot"] = "/home/julio/.dotfiles",
			},
		},

		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("frecency")
telescope.load_extension("ui-select")
