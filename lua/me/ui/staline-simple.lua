local staline = require("staline")
local icons = require("me.ui.styles").icons()
local lsp_icons = require("me.ui.styles").lsp()
local theme = require("me.ui.colors").kanagawa()

-- git status
local git_status = function()
	return vim.b.gitsigns_status or ""
end

-- scrollbar
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
			{ "StalineBranch", "branch" },
			git_status,
			-- get_git_status,
			-- { "StalineGitStatus", git_status },
			" ",
			"lsp",
			{ "StalineName", "file_name" },
			-- { "StalinePavel", "lsp" }
		},
		-- mid = { "lsp_name", },
		mid = {
			-- { "StalineName", "file_name" },
		},
		right = {
			{ "StalineLspNames", "lsp_name" },
			"line_column",
			-- "  ",
			{ "StalineScroll", percentage },
		},
	},
	defaults = {
		true_colors = true, -- LSP highlighing
		font_active = "none",
		-- branch_symbol = " ", -- Change the branch symbol
		mod_symbol = "  ", -- Change the modified symbol
		-- mod_symbol = " " .. icons.misc.circle,
		lsp_client_symbol = lsp_icons.kind.Event .. " ",
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
		packer = { "Packer", icons.buftype.packer },
		TelescopePrompt = { "Telescope", icons.buftype.telescope },
		vista = { "Vista", icons.buftype.vista },
	},
	lsp_symbols = {
		Error = icons.lsp.error,
		Info = icons.lsp.info,
		Warn = icons.lsp.warn,
		Hint = icons.lsp.hint,
	},
})

-- Highlight
vim.cmd("highlight StalineBranch guifg=" .. theme.cyan)
vim.cmd("highlight StalineName guifg=" .. theme.cyan)
vim.cmd("highlight StalineGitStatus guifg=" .. theme.red)
vim.cmd("highlight StalineLspNames guifg=" .. theme.cyan)
-- vim.cmd('highlight StalineScroll guifg=' .. theme.red)
-- vim.cmd('hi StalineBranch guifg=' .. theme.blue .. ' guibg=' .. theme.red)
-- vim.cmd("hi StalineBranch guifg=" .. theme.blue)

--[[ stabline.setup({
  style = "bar",
  stab_left = "┃",
  stab_right = " ",
  bg = theme.background,
  fg = theme.foreground,
  inactive_bg = theme.other_background,
  inactive_fg = theme.lightgrey,
  exclude_fts = {
    "help",
    "neo-tree",
    "vista",
    "toggleterm",
  },
  font_active = "bold",
  font_inactive = "italic",
  stab_start = "", -- The starting of stabline
  stab_end = "",
}) ]]

-- highlight
-- hi(0, "StalineBranch", { fg = theme.blue, bold = true })
-- hi(0, "StalineName", { fg = theme.cyan })
-- hi(0, "StalinePavel", { fg = theme.red })
-- hi(0, "StalineGitStatus", { fg = theme.red })
-- hi(0, "StalineLspNames", { fg = theme.cyan, bold = false })
-- hi(0, "StalineScroll", { fg = theme.red, bold = false })
