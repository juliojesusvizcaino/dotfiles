vim.notify = require("notify")

vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.scrolloff = 6

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

vim.keymap.set('n', "<leader>`", "<C-^>", { desc = 'Change to previous buffer' })
vim.keymap.set('n', "<leader>gg", function() lazygit:toggle() end, { desc = 'lazygit' })

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
