-- git mappings

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

-- gitsings
local status_ok, gitsigns = pcall(require, "gitsigns")
if status_ok then
	wk.register({
		g = {
			name = "+git",
			t = {
				gitsigns.toggle_current_line_blame,
				"toggle blame",
			},
			c = { "<cmd>Telescope git_bcommits<CR>", "bcommits" },
			b = { "<cmd>Telescope git_branches<CR>", "branches" },
			g = { "<cmd>Telescope git_commits<CR>", "commits" },
			i = { ":<C-U>Gitsigns select_hunk<CR>", "select hunk" },
		},
	}, { prefix = "<leader>" })

	wk.register({
		["[c"] = { "<cmd>lua require('gitsigns.actions').prev_hunk()<CR>", "prev hunk" },
		["]c"] = { "<cmd>lua require('gitsigns.actions').next_hunk()<CR>", "next hunk" },
		["]a"] = { "<cmd>lua require('gitsigns').preview_hunk()<CR>", "preview hunk" },
	})
else
	return
end

-- neogit
local present_neogit, neogit = pcall(require, "neogit")
if present_neogit then
	wk.register({
		g = {
			n = {
				function()
					neogit.open()
				end,
				"neogit open",
			},
			z = {
				function()
					neogit.open({ kind = "split" })
				end,
				"commit popup",
			},
		},
	}, { prefix = "<leader>" })
end

-- diffview
local present_diff, diffview = pcall(require, "diffview")
if present_diff then
	wk.register({
		g = {
			o = { "<cmd>DiffviewOpen<CR>", "diffview open" },
			O = { "<cmd>DiffviewClose<CR>", "diffview close" },
		},
	}, { prefix = "<leader>" })
end
