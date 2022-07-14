local M = {}
function M.config()
	local conditions = require("heirline.conditions")
	local utils = require("heirline.utils")
    local left_rounded = ''
    local right_rounded = ''

	-- local colors = require("tokyonight.colors").setup({}) -- pass in any of the config options as explained above
    local colors = require("plugins.themes.theme-colors").colors()

	-- local tokyonight_utils = require("tokyonight.util")
	local Space = { provider = " " }
	local Sep = { provider = "❱", hl = { fg = colors.blue } }
	local Align = { provider = "%=" }
	local TerminalName = {
		-- we could add a condition to check that buftype == 'terminal'
		-- or we could do that later (see #conditional-statuslines below)
		provider = function()
			local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
			return " " .. tname
		end,
		hl = { fg = colors.blue, bold = true },
	}

	-- Components {{{
	local ViMode = {
		static = {
			mode_names = {
				-- change the strings if you like it vvvvverbose!
				n = "NO",
				no = "N?",
				nov = "N?",
				noV = "N?",
				["no\22"] = "N?",
				niI = "Ni",
				niR = "Nr",
				niV = "Nv",
				nt = "Nt",
				v = "VI",
				vs = "Vs",
				V = "VI_",
				Vs = "Vs",
				["\22"] = "^V",
				["\22s"] = "^V",
				s = "S",
				S = "S_",
				["\19"] = "^S",
				i = "IN",
				ic = "Ic",
				ix = "Ix",
				R = "RE",
				Rc = "Rc",
				Rx = "Rx",
				Rv = "Rv",
				Rvc = "Rv",
				Rvx = "Rv",
				c = "CO",
				cv = "Ex",
				r = "...",
				rm = "M",
				["r?"] = "?",
				["!"] = "!",
				t = "TERM",
			},
		},
		provider = function(self)
			-- return " %2(" .. self.mode_names[vim.fn.mode(1)] .. "%)"
			-- return " %2(" .. self.mode_names[vim.fn.mode(1)] .. "%)"
			return '●' .. " %2(" .. self.mode_names[vim.fn.mode(1)] .. "%)"
		end,
		hl = function(self)
			local color = self:mode_color() -- here!
			return { fg = colors.black, bold = true, bg = color }
		end,
	}

	ViMode = utils.surround({ "", "" }, function(self)
		return self:mode_color()
	end, { ViMode, hl = { fg = "black" } })
	-- we are surrounding the component and adjusting the foreground in one go!
	-- we are surrounding the component and adjusting the foreground in one go!
	-- File stuff {{{
	local FileNameBlock = {
		-- let's first set up some attributes needed by this component and it's children
		init = function(self)
			self.filename = vim.api.nvim_buf_get_name(0)
		end,
	}

	local FileIcon = {
		init = function(self)
			local filename = self.filename
			local extension = vim.fn.fnamemodify(filename, ":e")
			self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(
				filename,
				extension,
				{ default = true }
			)
		end,
		provider = function(self)
			return self.icon and (self.icon .. " ")
		end,
		hl = function(self)
			return { fg = self.icon_color }
		end,
	}

	local FileName = {
		provider = function(self)
			-- first, trim the pattern relative to the current directory. For other
			-- options, see :h filename-modifers
			local filename = vim.fn.fnamemodify(self.filename, ":.")
			if filename == "" then
				return "[No Name]"
			end
			-- now, if the filename would occupy more than 1/4th of the available
			-- space, we trim the file path to its initials
			-- See Flexible Components section below for dynamic truncation
			if not conditions.width_percent_below(#filename, 0.25) then
				filename = vim.fn.pathshorten(filename)
			end
			return filename
		end,
		hl = { fg = utils.get_highlight("Directory").fg },
	}

	local FileFlags = {
		{
			provider = function()
				if vim.bo.modified then
					return "[+]"
				end
			end,
			hl = { fg = colors.green },
		},
		{
			provider = function()
				if not vim.bo.modifiable or vim.bo.readonly then
					return ""
				end
			end,
			hl = { fg = colors.orange },
		},
	}

	-- Now, let's say that we want the filename color to change if the buffer is
	-- modified. Of course, we could do that directly using the FileName.hl field,
	-- but we'll see how easy it is to alter existing components using a "modifier"
	-- component

	local FileNameModifer = {
		hl = function()
			if vim.bo.modified then
				-- use `force` because we need to override the child's hl foreground
				return { fg = colors.cyan, bold = false, force = true }
			end
		end,
	}

	-- let's add the children to our FileNameBlock component
	FileNameBlock = utils.insert(
		FileNameBlock,
		FileIcon,
		utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
		unpack(FileFlags), -- A small optimisation, since their parent does nothing
		{ provider = "%<" } -- this means that the statusline is cut here when there's not enough space
	)

	local FileType = {
		provider = function()
			return string.upper(vim.bo.filetype)
		end,
		hl = { fg = utils.get_highlight("Type").fg, bold = true },
	}

	local FileEncoding = {
		provider = function()
			local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
			return enc ~= "utf-8" and enc:upper()
		end,
	}

	local FileFormat = {
		provider = function()
			local fmt = vim.bo.fileformat
			return fmt ~= "unix" and fmt:upper()
		end,
	}

	local FileSize = {
		provider = function()
			-- stackoverflow, compute human readable file size
			local suffix = { "b", "k", "M", "G", "T", "P", "E" }
			local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
			fsize = (fsize < 0 and 0) or fsize
			if fsize <= 0 then
				return "0" .. suffix[1]
			end
			local i = math.floor((math.log(fsize) / math.log(1024)))
			return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i])
		end,
	}

	local FileLastModified = {
		-- did you know? Vim is full of functions!
		provider = function()
			local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
			return (ftime > 0) and os.date("%c", ftime)
		end,
	}

	local Ruler = {
		-- %l = current line number
		-- %L = number of lines in the buffer
		-- %c = column number
		-- %P = percentage through file of displayed window
		provider = "%7(%l/%3L%):%2c %P",
	}
	-- I take no credits for this! :lion:
	local ScrollBar = {
		static = {
			sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
			-- Another variant, because the more choice the better.
			-- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
		},
		provider = function(self)
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			local lines = vim.api.nvim_buf_line_count(0)
			local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
			return string.rep(self.sbar[i], 2)
		end,
		hl = { fg = colors.blue, bg = colors.blue },
	}

	local WorkDir = {
		provider = function(self)
			self.icon = " "
			local cwd = vim.fn.getcwd(0)
			self.cwd = vim.fn.fnamemodify(cwd, ":~")
		end,
		hl = { fg = colors.blue, bold = false },

		utils.make_flexible_component(1, {
			-- evaluates to the full-lenth path
			provider = function(self)
				local trail = self.cwd:sub(-1) == "/" and "" or "/"
				return self.icon .. self.cwd .. trail
			end,
		}, {
			-- evaluates to the shortened path
			provider = function(self)
				local cwd = vim.fn.pathshorten(self.cwd)
				local trail = self.cwd:sub(-1) == "/" and "" or "/"
				return self.icon .. cwd .. trail
			end,
		}, {
			-- evaluates to "", hiding the component
			provider = "",
		}),
	}
	-- }}}

	-- Lsp Stuff {{{

	local LSPActive = {
		condition = conditions.lsp_attached,

		provider = "LSP  ",

		hl = { fg = colors.green, bold = true },
	}

	-- Awesome plugin
	local Gps = {
		condition = require("nvim-gps").is_available,
		provider = require("nvim-gps").get_location,
		hl = { fg = colors.gray },
	}

	local Diagnostics = {

		condition = conditions.has_diagnostics,

		static = {
			error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
			warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
			info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
			hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
		},

		init = function(self)
			self.errors = #vim.diagnostic.get(0, {
				severity = vim.diagnostic.severity.ERROR,
			})
			self.warnings = #vim.diagnostic.get(0, {
				severity = vim.diagnostic.severity.WARN,
			})
			self.hints = #vim.diagnostic.get(0, {
				severity = vim.diagnostic.severity.HINT,
			})
			self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
		end,

		{ provider = "![" },
		{
			provider = function(self)
				-- 0 is just another output, we can decide to print it or not!
				return self.errors > 0 and (self.error_icon .. self.errors .. " ")
			end,
			hl = { fg = colors.red },
		},
		{
			provider = function(self)
				return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
			end,
			hl = { fg = colors.yellow },
		},
		{
			provider = function(self)
				return self.info > 0 and (self.info_icon .. self.info .. " ")
			end,
			hl = { fg = colors.blue },
		},
		{
			provider = function(self)
				return self.hints > 0 and (self.hint_icon .. self.hints)
			end,
			hl = { fg = colors.blue },
		},
		{ provider = "]" },
	}
	-- }}} ! Lsp stuff

	-- Git stuff {{{
	local Git = {
		condition = conditions.is_git_repo,

		init = function(self)
			self.status_dict = vim.b.gitsigns_status_dict
			self.has_changes = self.status_dict.added ~= 0
				or self.status_dict.removed ~= 0
				or self.status_dict.changed ~= 0
		end,

		hl = { fg = colors.green },

		Sep,
		Space,
		{ -- git branch name
			provider = function(self)
				local repo_name = vim.fn.fnamemodify(self.status_dict.root, ":t")
				return " " .. repo_name .. "  " .. self.status_dict.head
			end,
		},
		-- You could handle delimiters, icons and counts similar to Diagnostics
		{
			condition = function(self)
				return self.has_changes
			end,
			provider = "  ",
		},
		{
			provider = function(self)
				local count = self.status_dict.added or 0
				return count > 0 and ("+" .. count)
			end,
			hl = { fg = colors.green },
		},
		{
			provider = function(self)
				local count = self.status_dict.removed or 0
				return count > 0 and ("-" .. count)
			end,
			hl = { fg = colors.red },
		},
		{
			provider = function(self)
				local count = self.status_dict.changed or 0
				return count > 0 and ("~" .. count)
			end,
			hl = { fg = colors.blue },
		},
	}
	-- }}} !Git stuff

	-- Winbar {{{

	local WinBars = {
		init = utils.pick_child_on_condition,
		{ -- Hide the winbar for special buffers
			condition = function()
				return conditions.buffer_matches({
					buftype = { "nofile", "prompt", "help", "quickfix" },
					filetype = { "^git.*", "fugitive" },
				})
			end,
			provider = "",
		},
		{ -- A special winbar for terminals
			condition = function()
				return conditions.buffer_matches({ buftype = { "terminal" } })
			end,
			utils.surround({ "", "" }, colors.red, { FileType, Space, TerminalName }),
		},
		{ -- An inactive winbar for regular files
			condition = function()
				return not conditions.is_active()
			end,
			provider = "",
		},
		-- A winbar for regular files
		{

			condition = conditions.has_diagnostics,
			utils.surround({
                left_rounded,
                right_rounded,
			}, colors.cyan, { hl = { fg = colors.blue }, Diagnostics }),
		},
	}

	-- }}} !Winbar

	-- Misc {{{
	local Obsession = {
		provider = function()
			local obsession_status = vim.fn.ObsessionStatus("OBS  ", "OBS  ")
			if #obsession_status == 0 then
				return "OBS 逸"
			else
				return obsession_status
			end
			-- return "OBS " .. vim.fn.ObsessionStatus(" ", " ") .. ""
		end,
		hl = { fg = colors.magenta, bold = true },
	}
	-- }}} !Misc
	--
	-- }}} !Components

	local DefaultStatusline = {
		-- xxx
		ViMode,
		Space,
		FileNameBlock,
		Space,
		Space,
		Git,
		Align,
		-- Gps,
		Align, -- xxx
		-- Obsession,
		Space,
		LSPActive,
		Space,
		FileType,
		Space,
		Ruler,
		Space,
		ScrollBar,
	}

	local InactiveStatusline = {
		condition = function()
			return not conditions.is_active()
		end,
		FileNameBlock,
		Align,
		hl = {
			-- fg = tokyonight_utils.brighten(colors.background, 0.3),
			fg = colors.background,
			bg = colors.darkgrey,
			force = true,
			bold = false,
		},
	}

	local SpecialStatusline = {
		condition = function()
			return conditions.buffer_matches({
				buftype = { "nofile", "prompt", "help", "quickfix" },
				filetype = { "^git.*", "fugitive" },
			})
		end,

		FileType,
		Space,
		Align,
	}

	local TerminalStatusline = {

		condition = function()
			return conditions.buffer_matches({ buftype = { "terminal" } })
		end,

		hl = { bg = colors.red },

		-- Quickly add a condition to the ViMode to only show it when buffer is active!
		{ condition = conditions.is_active, ViMode, Space },
		FileType,
		Space,
		TerminalName,
		Align,
	}

	local StatusLines = {

		hl = function()
			if conditions.is_active() then
				return {
					fg = utils.get_highlight("StatusLine").fg,
					bg = utils.get_highlight("StatusLine").bg,
				}
			else
				return {
					fg = utils.get_highlight("StatusLineNC").fg,
					bg = utils.get_highlight("StatusLineNC").bg,
				}
			end
		end,

		static = {
			mode_colors = {
				n = colors.blue,
				i = colors.green,
				v = colors.cyan,
				V = colors.cyan,
				["\22"] = colors.cyan,
				c = colors.orange,
				s = colors.purple,
				S = colors.purple,
				["\19"] = colors.purple,
				R = colors.orange,
				r = colors.orange,
				["!"] = colors.red,
				t = colors.green,
			},
			mode_color = function(self)
				local mode = conditions.is_active() and vim.fn.mode() or "n"
				return self.mode_colors[mode]
			end,
		},

		init = utils.pick_child_on_condition,

		SpecialStatusline,
		TerminalStatusline,
		InactiveStatusline,
		DefaultStatusline,
	}

	-- This is done so that when the config is reloaded on the fly, the colors are re-applied
	vim.cmd([[
  augroup heirline
  autocmd!
  autocmd ColorScheme * lua require'heirline'.reset_highlights();
  augroup END
  ]])

	require("heirline").setup(StatusLines, WinBars)
end
return M

--[[
{
  bg = "#24283b",
  bg_dark = "#1f2335",
  bg_float = "#24283b",
  bg_highlight = "#292e42",
  bg_popup = "#1f2335",
  bg_search = "#3d59a1",
  bg_sidebar = "#24283b",
  bg_statusline = "#1f2335",
  bg_visual = "#364A82",
  black = "#1D202F",
  blue = "#7aa2f7",
  blue0 = "#3d59a1",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#B4F9F8",
  blue7 = "#394b70",
  border = "#1D202F",
  border_highlight = "#3d59a1",
  comment = "#565f89",
  cyan = "#7dcfff",
  dark3 = "#545c7e",
  dark5 = "#737aa2",
  diff = {
    add = "#283B4D",
    change = "#272D43",
    delete = "#3F2D3D",
    text = "#394b70"
  },
  error = "#db4b4b",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#3b4261",
  fg_sidebar = "#a9b1d6",
  git = {
    add = "#449dab",
    change = "#6183bb",
    conflict = "#bb7a61",
    delete = "#914c54",
    ignore = "#545c7e"
  },
  gitSigns = {
    add = "#266d6a",
    change = "#536c9e",
    delete = "#b2555b"
  },
  green = "#9ece6a",
  green1 = "#73daca",
  green2 = "#41a6b5",
  hint = "#1abc9c",
  info = "#0db9d7",
  magenta = "#bb9af7",
  magenta2 = "#ff007c",
  none = "NONE",
  orange = "#ff9e64",
  purple = "#9d7cd8",
  red = "#f7768e",
  red1 = "#db4b4b",
  teal = "#1abc9c",
  terminal_black = "#414868",
  warning = "#e0af68",
  yellow = "#e0af68"
}
  ]]
-- vim:fdm=marker
