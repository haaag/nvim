-- https://github.com/SmiteshP/nvim-navic
local M = {}

-- TODO: Fix f*king icons.
local styles_lsp = require("me.ui.styles").lsp()
local kind = styles_lsp.kind

M.config = function()
  local options = {
    icons = {
      Array = kind.Array .. " ",
      Boolean = kind.Boolean,
      Class = kind.Class .. " ",
      Color = kind.Color .. " ",
      Constant = kind.Constant .. " ",
      Constructor = kind.Constructor .. " ",
      Enum = kind.Enum .. " ",
      EnumMember = kind.EnumMember .. " ",
      Event = kind.Event .. " ",
      Field = kind.Field .. " ",
      File = kind.File .. " ",
      Folder = kind.Folder .. " ",
      Function = kind.Function .. " ",
      Interface = kind.Interface .. " ",
      Keyword = kind.Keyword .. " ",
      Method = kind.Method .. " ",
      Module = kind.Module .. " ",
      Namespace = kind.Namespace .. " ",
      Null = kind.Null .. " ",
      Number = kind.Number .. " ",
      Object = kind.Object .. " ",
      Operator = kind.Operator .. " ",
      Package = kind.Package .. " ",
      Property = kind.Property .. " ",
      Reference = kind.Reference .. " ",
      Snippet = kind.Snippet .. " ",
      String = kind.String .. " ",
      Struct = kind.Struct .. " ",
      Text = kind.Text .. " ",
      TypeParameter = kind.TypeParameter .. " ",
      Unit = kind.Unit .. " ",
      Value = kind.Value .. " ",
      Variable = kind.Variable .. " ",
    },
    highlight = true,
    separator = " " .. ">" .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  }
  return options
end

--[[ M.highlights = function()
	local kana_present, kanagawa = pcall(require, "kanagawa.colors")
	if kana_present then
		local colors = kanagawa.setup()
		local highlights = {
			NavicIconsFile = { fg = colors.springViolet2 },
			NavicIconsModule = { fg = colors.boatYellow2 },
			NavicIconsNamespace = { fg = colors.springViolet2 },
			NavicIconsPackage = { fg = colors.springViolet1 },
			NavicIconsClass = { fg = colors.surimiOrange },
			NavicIconsMethod = { fg = colors.crystalBlue },
			NavicIconsProperty = { fg = colors.waveAqua2 },
			NavicIconsField = { fg = colors.waveAqua1 },
			NavicIconsConstructor = { fg = colors.surimiOrange },
			NavicIconsEnum = { fg = colors.boatYellow2 },
			NavicIconsInterface = { fg = colors.carpYellow },
			NavicIconsFunction = { fg = colors.crystalBlue },
			NavicIconsVariable = { fg = colors.oniViolet },
			NavicIconsConstant = { fg = colors.oniViolet },
			NavicIconsString = { fg = colors.springGreen },
			NavicIconsNumber = { fg = colors.sakuraPink },
			NavicIconsBoolean = { fg = colors.surimiOrange },
			NavicIconsArray = { fg = colors.waveAqua2 },
			NavicIconsObject = { fg = colors.surimiOrange },
			NavicIconsKey = { fg = colors.oniViolet },
			NavicIconsNull = { fg = colors.carpYellow },
			NavicIconsEnumMember = { fg = colors.carpYellow },
			NavicIconsStruct = { fg = colors.surimiOrange },
			NavicIconsEvent = { fg = colors.surimiOrange },
			NavicIconsOperator = { fg = colors.springViolet2 },
			NavicIconsTypeParameter = { fg = colors.springBlue },
			NavicText = { fg = colors.fujiWhite },
			NavicSeparator = { fg = colors.fujiWhite },
		}

		for highlight, setting in pairs(highlights) do
			vim.api.nvim_set_hl(0, highlight, { default = true, bg = setting.bg, fg = setting.fg })
		end
	end
end ]]

M.setup = function()
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end

  M.create_winbar()
  navic.setup(M.config())
end

M.winbar_filetype_exclude = {
  "help",
  "packer",
  "neo-tree",
  "neogitstatus",
  "Trouble",
  "Outline",
  "spectre_panel",
  "toggleterm",
  "DressingSelect",
  "Jaq",
  "harpoon",
  "dapui_scopes",
  "dapui_breakpoints",
  "dapui_stacks",
  "dapui_watches",
  "dap-repl",
  "dap-terminal",
  "dapui_console",
  "lab",
  "Markdown",
  "nnn",
  "",
}

M.isempty = function(s)
  return s == nil or s == ""
end

M.get_buf_option = function(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

M.get_filename = function()
  local filename = vim.fn.expand("%:t")
  local extension = vim.fn.expand("%:e")

  if not M.isempty(filename) then
    local file_icon, file_icon_color =
      require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

    local hl_group = "FileIconColor" .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if M.isempty(file_icon) then
      file_icon = ""
    end

    local navic_text = vim.api.nvim_get_hl_by_name("Normal", true)
    vim.api.nvim_set_hl(0, "Winbar", { fg = navic_text.foreground })

    return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. filename .. "%*"
  end
end

local get_gps = function()
  local status_gps_ok, gps = pcall(require, "nvim-navic")
  if not status_gps_ok then
    return ""
  end

  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return ""
  end

  if not gps.is_available() or gps_location == "error" then
    return ""
  end

  if not M.isempty(gps_location) then
    return ">" .. " " .. gps_location
  else
    return ""
  end
end

local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    return true
  end
  return false
end

M.get_winbar = function()
  if excludes() then
    return
  end
  local value = M.get_filename()

  local gps_added = false
  if not M.isempty(value) then
    local gps_value = get_gps()
    value = value .. " " .. gps_value
    if not M.isempty(gps_value) then
      gps_added = true
    end
  end

  if not M.isempty(value) and M.get_buf_option("mod") then
    -- TODO: replace with circle
    local mod = "%#LspCodeLens#" .. "●" .. "%*"
    if gps_added then
      value = value .. " " .. mod
    else
      value = value .. mod
    end
  end

  local num_tabs = #vim.api.nvim_list_tabpages()

  if num_tabs > 1 and not M.isempty(value) then
    local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
    value = value .. "%=" .. tabpage_number .. "/" .. tostring(num_tabs)
  end

  local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
  if not status_ok then
    return
  end
end

M.create_winbar = function()
  vim.api.nvim_create_augroup("_winbar", {})
  if vim.fn.has("nvim-0.8") == 1 then
    vim.api.nvim_create_autocmd({
      "CursorMoved",
      "CursorHold",
      "BufWinEnter",
      "BufFilePost",
      "InsertEnter",
      "BufWritePost",
      "TabClosed",
    }, {
      group = "_winbar",
      callback = function()
        local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
        if not status_ok then
          require("me.lsp.navic").get_winbar()
        end
      end,
    })
  end
end

return M
