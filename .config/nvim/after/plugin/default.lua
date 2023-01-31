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
			t = {
				function()
					vim.cmd("wa")
					require("neotest").run.run({ strategy = "dap" })
				end,
				"dwim",
			},
			f = {
				function()
					vim.cmd("wa")
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				"file",
			},
			s = { require("neotest").run.stop, "stop" },
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
		o = {
			name = "+open",
			o = {
				function()
					require("gitlinker").get_buf_range_url(
						"v",
						{ action_callback = require("gitlinker.actions").open_in_browser }
					)
				end,
				"Browse file",
				silent = true,
				mode = { "n", "v" },
			},
			h = {
				function()
					require("gitlinker").get_repo_url({
						action_callback = require("gitlinker.actions").open_in_browser,
					})
				end,
				"Browse file",
			},
		},
		y = { require("gitlinker").get_buf_range_url, "Copy link to remote" },
		Y = {
			function()
				require("gitlinker").get_repo_url()
			end,
			"Copy link to homepage",
		},
	},
	h = {
		name = "+help",
		p = { "<cmd>Lazy<cr>", "Package manager" },
	},
	o = {
		name = "+open",
		d = {
			name = "+debug",
			r = { require("neotest").run.attach, "attach repl" },
			o = { require("neotest").output.open, "output" },
			p = { require("neotest").output_panel.open, "panel" },
			s = { require("neotest").summary.open, "summary" },
		},
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

-- https://github.com/anuvyklack/hydra.nvim/issues/3#issuecomment-1162988750
local hydra = require("hydra")
local dap = require("dap")

local hint = [[
 _n_: step over   _s_: Continue/Start   _b_: Breakpoint     _K_: Eval
 _i_: step into   _x_: Quit             ^ ^                 ^ ^
 _o_: step out    _X_: Stop             ^ ^
 _c_: to cursor   _C_: Close UI
 ^
 ^ ^              _q_: exit
]]

local dap_hydra = hydra({
	hint = hint,
	config = {
		color = "pink",
		invoke_on_body = true,
		hint = {
			position = "bottom",
			border = "rounded",
		},
	},
	name = "dap",
	mode = { "n", "x" },
	body = "<leader>dh",
	heads = {
		{ "n", dap.step_over, { silent = true } },
		{ "i", dap.step_into, { silent = true } },
		{ "o", dap.step_out, { silent = true } },
		{ "c", dap.run_to_cursor, { silent = true } },
		{ "s", dap.continue, { silent = true } },
		{ "x", ":lua require'dap'.disconnect({ terminateDebuggee = false })<CR>", { exit = true, silent = true } },
		{ "X", dap.close, { silent = true } },
		{ "C", ":lua require('dapui').close()<cr>:DapVirtualTextForceRefresh<CR>", { silent = true } },
		{ "b", dap.toggle_breakpoint, { silent = true } },
		{ "K", ":lua require('dap.ui.widgets').hover()<CR>", { silent = true } },
		{ "q", nil, { exit = true, nowait = true } },
	},
})

hydra.spawn = function(head)
	if head == "dap-hydra" then
		dap_hydra:activate()
	end
end
