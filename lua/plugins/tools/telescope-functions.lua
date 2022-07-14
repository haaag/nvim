-- Function for nvim files.
---------------------------
local cmd = vim.cmd
local HOME = tostring(os.getenv("HOME"))

local status_ok, telescope = pcall(require, "telescope.builtin")
if not status_ok then
	return
end

local theme = require("telescope.themes")
local actions = require("telescope.actions")

local M = {}

M.search_dotfiles_vim = function()
	telescope.find_files(theme.get_dropdown({
		previewer = false,
		winblend = 10,
		prompt_title = "< nvim config >",
		cwd = HOME .. "/.config/nvim/",
	}))
end

M.dotfiles_nvim = function()
	require("telescope.builtin").find_files({
		prompt_title = "< nvim config >",
		cwd = "~/.config/nvim/",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

M.dotfiles_nvim_new = function()
	require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
		-- require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
		previewer = false,
		-- winblend = 20,
		prompt_title = "< nvim config >",
		cwd = "~/.config/nvim/",
	}))
end

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< dotfiles >",
		cwd = "~/.dotfiles/",
		find_command = { "fd", "--type", "f", "--hidden" },
	})
end

M.nvim_dotfiles = function()
	require("telescope.builtin").find_files({
		require("telescope.themes").get_dropdown({
			borderchars = {
				{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
				results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
				preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
			width = 0.8,
			previewer = false,
			prompt_title = false,
			cwd = "~/.config/nvim/",
		}),
	})
end

M.dotfiles_nvim_bk = function()
	require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
		previewer = false,
		winblend = 10,
		prompt_title = "< nvim.bk >",
		cwd = HOME .. "/.config/nvim.bk/",
	}))
end

M.work_files = function()
	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
		-- previewer = true,
		winblend = 10,
		prompt_title = "< work files >",
		cwd = HOME .. "/work/",
	}))
end

M.work_files_new = function()
	telescope.find_files({
		prompt_title = "< work >",
		cwd = "~/work/",
		find_command = { "fd", "--type", "f", "--hidden" },
	})
end

M.projects_files = function()
	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
		previewer = false,
		winblend = 10,
		prompt_title = "< work files >",
		cwd = HOME .. "/code/git/",
	}))
end

M.nvim_cache_file = function()
	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
		previewer = false,
		winblend = 10,
		prompt_title = "< cache files >",
		cwd = HOME .. "/.local/share/nvim/site/pack/packer",
	}))
end

return M
