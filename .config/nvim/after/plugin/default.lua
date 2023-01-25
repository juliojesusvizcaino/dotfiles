vim.notify = require("notify")

vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.scrolloff = 6

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

local wk = require("which-key")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local agitator = require("agitator")

wk.register({
	g = {
		name = "+go to",
		p = { require("pytrize.api").jump_fixture, "pytest fixture" },
	},
})

wk.register({
	["`"] = { "<C-^>", "Change to previous buffer" },
	["<Tab>"] = { require("harpoon.ui").toggle_quick_menu, "harpoon" },
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
		p = { "<cmd>Lazy<cr>", "Package manager" },
	},
	p = {
		name = "+project",
	},
	t = {
		name = "+toggle",
		b = { agitator.git_blame_toggle, "blame" },
	},
	x = {
		name = "+diagnostics",
		x = { "<cmd>TroubleToggle<cr>", "toggle" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "toggle workspace" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "toggle document" },
		l = { "<cmd>TroubleToggle loclist<cr>", "toggle loclist" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "toggle quicklist" },
		r = { "<cmd>TroubleRefresh<cr>", "refresh" },
	},
	y = { '"+y', "copy into clipboard", mode = { "n", "v" } },
	Y = { '"+Y', "copy whole line into clipboard", mode = { "n", "v" } },
	z = { '"_dP', "paste-no-copy", mode = "x" },
}, { prefix = "<leader>" })

local harpoon_mappings = {}
for i, key in ipairs({ "n", "e", "i", "o", "l", "u", "y", ";" }) do
	harpoon_mappings["<A-" .. key .. ">"] = {
		function()
			return require("harpoon.ui").nav_file(i)
		end,
		"harpoon " .. i,
	}
end

wk.register(harpoon_mappings)

wk.register({ gR = { "<cmd>TroubleToggle lsp_references<cr>", "diagnostics lsp references" } })
