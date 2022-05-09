local status_ok, staline = pcall(require, "staline")
if not status_ok then
	return
end

-- local stabline = require("stabline")
local theme = require("plugins.themes.theme-colors").colors()
local hi = vim.api.nvim_set_hl

local percentage = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = {
		"__",
		"▁▁",
		"▂▂",
		"▃▃",
		"▄▄",
		"▅▅",
		"▆▆",
		"▇▇",
		"██",
	}
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

staline.setup({
	sections = {
		left = {
			"mode",
			" ",
			{ "StalineBranch", "branch" },
			"-lsp",
			-- branch,
		},
		mid = { { "StalineName", "file_name" } },
		right = { "lsp_name", "  ", percentage },
	},
	defaults = {
		true_colors = true, -- LSP highlighing
		font_active = "none",
		branch_symbol = " ", -- Change the branch symbol
		mod_symbol = "  ", -- Change the modified symbol
	},
	mode_icons = {
		["n"] = "NORMAL",
		["no"] = "NORMAL",
		["nov"] = "NORMAL",
		["noV"] = "NORMAL",
		["niI"] = "NORMAL",
		["niR"] = "NORMAL",
		["niV"] = "NORMAL",
		["i"] = "INSERT",
		["ic"] = "INSERT",
		["ix"] = "INSERT",
		["s"] = "INSERT",
		["S"] = "INSERT",
		["v"] = "VISUAL",
		["V"] = "VISUAL",
		[""] = "VISUAL",
		["r"] = "REPLACE",
		["r?"] = "REPLACE",
		["R"] = "REPLACE",
		["c"] = "COMMAND",
		["t"] = "TERMINAL",
	},
	mode_colors = {
		n = theme.blue,
		i = theme.cyan,
		c = theme.yellow,
		v = theme.red,
		V = theme.red,
	},
	special_table = {
		NvimTree = { "File Explorer", " " },
		packer = { "Packer", " " },
		TelescopePrompt = { "Telescope", " " },
	},
	lsp_symbols = { Error = " ", Info = " ", Warn = " ", Hint = " " },
})

-- highlight
hi(0, "StalineBranch", { fg = theme.blue })
-- vim.cmd('hi StalineBranch guifg=' .. theme.blue .. ' guibg=' .. theme.red)
hi(0, "StalineName", { fg = theme.cyan })
