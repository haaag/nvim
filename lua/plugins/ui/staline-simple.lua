local status_ok, staline = pcall(require, "staline")
if not status_ok then
	return
end

local theme = require("plugins.themes.theme-colors").colors()

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

local time = function()
	return os.date("%a │ %H:%M %x")
end

local cmd = vim.cmd

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
	},
	special_table = {
		NvimTree = { "File Explorer", " " },
		packer = { "Packer", " " },
		TelescopePrompt = { "Telescope", " " },
	},
	lsp_symbols = { Error = " ", Info = " ", Warn = " ", Hint = " " },
})

-- cmd([[hi StalineBranch guifg=#C4A7E7]])
-- cmd([[hi StalineBranch guifg=#C4A7E7]])
cmd("hi StalineBranch guifg=" .. theme.cyan)
-- cmd("hi StalineName guifg=" .. theme.orange)
cmd([[hi StalineName guifg=#EBBCBA]])
