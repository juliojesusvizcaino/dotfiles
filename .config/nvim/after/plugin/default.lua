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

vim.keymap.set("n", "<leader>`", "<C-^>", { desc = "Change to previous buffer" })
vim.keymap.set("n", "<leader>gg", function()
    lazygit:toggle()
end, { desc = "lazygit" })

wk.register({
    g = {
        name = "+go to",
        p = { require("pytrize.api").jump_fixture, "pytest fixture" },
    },
})

wk.register({
    -- ["1"] = require("harpoon.ui").nav_file(1),
    -- ["2"] = require("harpoon.ui").nav_file(2),
    ["`"] = { "<C-^>", "Change to previous buffer" },
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
    p = {
        name = "+project",
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
