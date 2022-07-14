local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
	return
end

devicons.set_icon({
	dg = { icon = "", color = "#61afef", name = "dg" },
	-- txt = { icon = "", color = "#6d8086", name = "txt" },
	txt = { icon = "", color = "#6d8086", name = "txt" },
	cfg = { icon = "", color = "#6d8086", name = "cfg" },
	pdf = { icon = "", color = "#b30b00", name = "Pdf" },
})

local M = {}

M.icons = function()
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	return signs
end

M.separators = {
	vertical_bar = "┃",
	vertical_bar_thin = "│",
	left = "",
	right = "",
	block = "█",
	left_filled = "",
	right_filled = "",
	slant_left = "",
	slant_left_thin = "",
	slant_right = "",
	slant_right_thin = "",
	slant_left_2 = "",
	slant_left_2_thin = "",
	slant_right_2 = "",
	slant_right_2_thin = "",
	left_rounded = "",
	left_rounded_thin = "",
	right_rounded = "",
	right_rounded_thin = "",
	circle = "●",
	github_icon = " ﯙ ",
	folder_icon = " ",
	ghost = "",
}

return M

--[[ local M = {}

M.kind = function()
	local kind = {
		Text = "",
		-- Method = "",
		-- Function = "",
		Constructor = "",
		Method = "",
		Function = "",
		Field = "",
		-- Variable = "",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = "",
	}
    return kind
end

return M ]]
