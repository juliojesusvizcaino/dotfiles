local nnoremap = require("trufas.keymap").nnoremap

local telescope_builtin = require("telescope.builtin")
local agitator = require("agitator")

nnoremap("<leader><leader>", function()
	-- return require("telescope").extensions.frecency.frecency({
	-- 	-- workspace = "CWD",
	-- 	sorter = require("telescope.config").values.file_sorter(),
	-- })
	return telescope_builtin.find_files({ hidden = true })
end)
nnoremap("<leader>/", function()
	return telescope_builtin.live_grep({
		additional_args = function(opts)
			return { "--hidden" }
		end,
	})
end)
nnoremap("<leader>*", function()
	return telescope_builtin.grep_string({
		additional_args = function(opts)
			return { "--hidden" }
		end,
	})
end)
nnoremap("<leader>.", "<cmd>Telescope file_browser path=%:p:h<CR>")
nnoremap("<leader>,", "<cmd>Telescope buffers<CR>")

nnoremap("<leader>`", "<C-^>")

-- buffer
nnoremap("<leader>br", "<cmd>e<CR>")

-- file
nnoremap("<leader>fs", "<cmd>w<CR>")

-- trouble
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true })
nnoremap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true })
nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true })
nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true })
nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true })
nnoremap("gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true })

local wk = require("which-key")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

wk.register({
	-- ["1"] = require("harpoon.ui").nav_file(1),
	-- ["2"] = require("harpoon.ui").nav_file(2),
	["<Tab>"] = { "<cmd>Telescope harpoon marks<CR>", "harpoon" },
	c = {
		name = "+code", -- optional group name
		t = {
			name = "+tests",
			t = { "<cmd>w<cr><cmd>TestNearest<CR>", "dwim" },
			e = { "<cmd>TestEdit<CR>", "edit" },
			f = { "<cmd>TestFile<CR>", "file" },
		},
	},
	f = {
		name = "+file",
		m = {
			name = "+marks",
			a = { require("harpoon.mark").add_file, "add file" },
		},
	},
	g = {
		name = "+git",
		g = {
			function()
				lazygit:toggle()
			end,
			"lazygit",
		},
		G = { "<cmd>Neogit<CR>", "git" },
		f = { "<cmd>G<CR>", "fugitive" },
		[" "] = { agitator.open_file_git_branch, "open file in branch" },
		["/"] = { agitator.search_git_branch, "search branch" },
		t = {
			function()
				-- vim.api.nvim_command('tabnew')
				return agitator.git_time_machine({ use_current_win = false })
			end,
			"time machine",
		},
	},
	h = {
		name = "+help",
		r = { "<cmd>:w<cr><cmd>:so<cr><cmd>PackerSync<cr>", "reload config" },
	},
	t = {
		name = "+toggle",
		b = { agitator.git_blame_toggle, "blame" },
	},
}, { prefix = "<leader>" })

local harpoon_mappings = {}
for i, key in ipairs({ "n", "e", "i", "o" }) do
	harpoon_mappings["<A-" .. key .. ">"] = {
		function()
			return require("harpoon.ui").nav_file(i)
		end,
		"harpoon " .. i,
	}
end

wk.register(harpoon_mappings)
