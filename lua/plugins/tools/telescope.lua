local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local colors = require("plugins.themes.theme-colors").colors()
local hi = vim.api.nvim_set_hl

telescope.setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = "   ",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-q>"] = actions.send_to_qflist,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-c>"] = function()
					vim.cmd([[stopinsert]]) -- start normal mode if we need it
				end,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

-- vim.cmd [[highlight TelescopeBorder guifg=#4c4c4c]]
-- vim.cmd [[highlight TelescopeSelection guifg=#ffffff guibg=#393939 gui=bold]]
-- vim.cmd [[highlight TelescopeSelectionCaret guifg=#749484 gui=bold]]

hi(0, "TelescopeBorder", { fg = colors.lightgrey })
hi(0, "TelescopeSelection", { fg = colors.yellow, bg = "#393939", bold = true})
hi(0, "TelescopeSelectionCaret", { fg = colors.red, bold = true })
