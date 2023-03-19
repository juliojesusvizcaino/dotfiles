-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")

vim.keymap.set("n", "<C-h>", "<cmd>KittyNavigateLeft<cr>", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<cmd>KittyNavigateDown<cr>", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<cmd>KittyNavigateUp<cr>", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<cmd>KittyNavigateRight<cr>", { desc = "Go to right window" })
