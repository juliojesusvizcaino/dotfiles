local nnoremap = require("trufas.keymap").nnoremap

local telescope = require("telescope.builtin")
local agitator = require("agitator")

nnoremap("<leader> ", function()
	return telescope.find_files({ hidden = true })
end)
nnoremap("<leader>/", telescope.live_grep)
nnoremap("<leader>*", telescope.grep_string)
nnoremap("<leader>.", "<cmd>Ex<CR>")
nnoremap("<leader>,", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>fs", "<cmd>w<CR>")

nnoremap("<leader>`", "<C-^>")

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
