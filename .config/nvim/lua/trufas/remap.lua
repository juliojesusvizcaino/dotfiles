local nnoremap = require("trufas.keymap").nnoremap

local telescope = require("telescope.builtin")

nnoremap("<leader> ", function() return telescope.find_files({ hidden = true }) end)
nnoremap("<leader>/", telescope.live_grep)
nnoremap("<leader>*", telescope.live_grep)
nnoremap("<leader>.", "<cmd>Ex<CR>")
nnoremap("<leader>,", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>fs", "<cmd>w<CR>")

nnoremap("<leader>`", "<C-^>")

-- git
nnoremap("<leader>gg", "<cmd>Neogit<CR>")
