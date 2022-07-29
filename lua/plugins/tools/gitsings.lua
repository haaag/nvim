local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	print("Error: gitsings")
	return
end

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

local colors = require("plugins.themes.theme-colors").colors()
local hi = vim.api.nvim_set_hl

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

-- highlights
-- hi(0, "GitSignsAdd", { bg = "none", fg = colors.green })
-- hi(0, "GitSignsChange", { bg = "none", fg = colors.blue })
-- hi(0, "GitSignsDelete", { bg = "none", fg = colors.red })

-- mappings
--[[ wk.register({
	g = {
		name = "+git",
		p = {
			function()
				gitsigns.prev_hunk()
			end,
			"previous hunk",
		},
		n = {
			function()
				gitsigns.next_hunk()
			end,
			"next hunk",
		},
		s = {
			name = "+stage",
			s = { gitsigns.stage_hunk, "stage hunk" },
			u = { gitsigns.undo_stage_hunk, "undo stage hunk" },
			r = {
				function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end,
				"reset hunk",
			},
		},
		P = {
			gitsigns.preview_hunk,
			"preview hunk",
		},
		t = {
			gitsigns.toggle_current_line_blame,
			"toggle blame",
		},
		c = { "<cmd>Telescope git_bcommits<CR>", "bcommits" },
		b = { "<cmd>Telescope git_branches<CR>", "branches" },
		g = { "<cmd>Telescope git_commits<CR>", "commits" },
		i = { ":<C-U>Gitsigns select_hunk<CR>", "select hunk" },
	},
}, { prefix = "<leader>" }) ]]

-- map("n", "[c", '<cmd>lua require("gitsigns.actions").prev_hunk()<CR>', options)
-- map("n", "]c", '<cmd>lua require("gitsigns.actions").next_hunk()<CR>', options)
-- map("n", "]a", '<cmd>lua require("gitsigns").preview_hunk()<CR>', options)
--
-- wk.register({
-- 	["[c"] = { "<cmd>lua require('gitsigns.actions').prev_hunk()<CR>", "prev hunk" },
-- 	["]c"] = { "<cmd>lua require('gitsigns.actions').next_hunk()<CR>", "next hunk" },
-- 	["]a"] = { "<cmd>lua require('gitsigns').preview_hunk()<CR>", "preview hunk" },
-- })
