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

-- git
nnoremap("<leader>gg", "<cmd>Neogit<CR>")
nnoremap("<leader>gf", "<cmd>G<CR>")
nnoremap("<leader>tB", agitator.git_blame_toggle)
nnoremap("<leader>g ", agitator.open_file_git_branch)
nnoremap("<leader>g/", agitator.search_git_branch)
nnoremap("<leader>gt", function()
	-- vim.api.nvim_command('tabnew')
	return agitator.git_time_machine({ use_current_win = false })
end)

-- trouble
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true })
nnoremap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true })
nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true })
nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true })
nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true })
nnoremap("gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true })

-- tests
nnoremap("<leader>mt", "<cmd>TestNearest<CR>")
nnoremap("<leader>me", "<cmd>TestEdit<CR>")
nnoremap("<leader>mf", "<cmd>TestFile<CR>")
