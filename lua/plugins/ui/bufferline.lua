vim.o.termguicolors = true
-- local theme = require("plugins.themes.theme-colors").colors()
local theme = require("kanagawa.colors").setup()

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local wk_present, wk = pcall(require, "which-key")
if not wk_present then
	return
end

bufferline.setup({
	options = {
		numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both"
		close_command = "bdelete! %d",
		offsets = { { filetype = "neo-tree", text = "", padding = 1 } },
		-- buffer_close_icon = "",
		close_icon = "",
		-- modified_icon = "",
		indicator_icon = "▎",
		-- indicator_icon = "▏",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 20,
		max_prefix_length = 20,
		tab_size = 15,
		show_tab_indicators = true,
		enforce_regular_tabs = true,
		view = "multiwindow",
		show_buffer_close_icons = false,
		show_close_icon = false,
		-- separator_style = "thin", -- "slant" | "thick" | "thin"
		separator_style = { "", "" },
		always_show_bufferline = true,
		name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
			-- remove extension from markdown files for example
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
	},
	-- highlights = {
	-- 	fill = { guifg = theme.darkgrey, guibg = theme.other_background },
	-- 	indicator_selected = { guifg = theme.blue },
	-- },
})

-- mappings
wk.register({
	["bg"] = { "<cmd>BufferLinePick<CR>", "choose buffer" },
	["<M-p>"] = { "<cmd>BufferLineCyclePrev<cr>", "Buf cycle prev" },
	["<M-n>"] = { "<cmd>BufferLineCycleNext<cr>", "Buf cycle prev" },
})
