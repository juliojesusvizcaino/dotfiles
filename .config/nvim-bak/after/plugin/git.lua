local something = require('trufas.keymap')
local neogit = require("neogit")

neogit.setup({
	disable_commit_confirmation = true,
	disable_insert_on_commit = false,
})

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(gs.next_hunk)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(gs.prev_hunk)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")
		map("n", "<leader>gS", gs.stage_buffer)
		map("n", "<leader>gu", gs.undo_stage_hunk)
		map("n", "<leader>gR", gs.reset_buffer)
		map("n", "<leader>gp", gs.preview_hunk)
		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>gd", gs.diffthis)
		map("n", "<leader>gD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>")
	end,
})
