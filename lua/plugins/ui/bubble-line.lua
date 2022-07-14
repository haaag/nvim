local theme = require("plugins.themes.theme-colors").colors()

vim.g.bubbly_tabline = 0

vim.g.bubbly_palette = {
	background = theme.background,
	foreground = theme.foreground,
	black = theme.black,
	red = theme.red,
	green = theme.green,
	yellow = theme.yellow,
	blue = theme.blue,
	purple = theme.purple,
	cyan = theme.cyan,
	white = theme.white,
	lightgrey = "#57595e",
	darkgrey = "#404247",
}

vim.g.bubbly_statusline = {
	"mode",

	"truncate",

	"path",
	"branch",
	"gitsigns",

	"divisor",

	"filetype",
	"progress",
}

vim.g.bubbly_colors = {
    branch = 'blue'
}
