local map = vim.keymap.set
local telescope = require("telescope")
local actions = require("telescope.actions")
local finders = require("telescope.builtin")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
})

local nvim_config = function()
	finders.find_files({
		prompt_title = "< nvim config >",
		cwd = "~/.config/nvim/",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

local search_dotfiles = function()
	if next(vim.fs.find({ ".git" })) then
		finders.git_files({
			show_untracked = true,
			prompt_title = "< dotfiles >",
			cwd = "~/.dotfiles/",
			find_command = { "fd", "--type", "f", "--hidden" },
		})
	else
		finders.find_files({
			prompt_title = "< dotfiles >",
			cwd = "~/.dotfiles/",
			find_command = { "fd", "--type", "f", "--hidden" },
		})
	end
end

local dev_projects = function()
	finders.find_files({
		prompt_title = "< dev files >",
		cwd = "~/dev/",
		layout_strategy = "horizontal",
	})
end

-- Mappings finders
map("n", "<leader>fv", nvim_config, { desc = "Nvim Config" })
map("n", "<leader>fD", search_dotfiles, { desc = "Find dotfiles" })
map("n", "<leader>fG", dev_projects, { desc = "Dev files" })

-- Mappings git
map("n", "<leader>gg", "<cmd>Telescope git_commits<CR>", { desc = "TCommits" })
map("n", "<leader>gc", "<cmd>Telescope git_bcommits<CR>", { desc = "TBranch commits" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "TBranches" })
