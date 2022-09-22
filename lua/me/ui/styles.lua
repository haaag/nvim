-- styles

local palette = {
  pale_red = "#E06C75",
  dark_red = "#be5046",
  light_red = "#c43e1f",
  dark_orange = "#FF922B",
  green = "#98c379",
  bright_yellow = "#FAB005",
  light_yellow = "#e5c07b",
  dark_blue = "#4e88ff",
  magenta = "#c678dd",
  comment_grey = "#5c6370",
  grey = "#3E4556",
  whitesmoke = "#626262",
  bright_blue = "#51afef",
  teal = "#15AABF",
}

local M = {}

M.separators = function()
  local separators = {
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

  return separators
end

M.icons = function()
  local icons = {
    lsp = {
      error = " ",
      warn = " ",
      hint = " ",
      info = " ",
    },
    git = {
      add = "", -- '',
      add_thin = "▏",
      add_more_thick = "┃",
      add_thick = "│",
      mod = "",
      remove = "", -- '',
      ignore = "",
      rename = "",
      diff = "",
      repo = "",
      logo = "",
      untracked = "✭",
      modified = "",
    },
    documents = {
      file = "",
      files = "",
      folder = "",
      open_folder = "",
    },
    type = {
      array = "",
      number = "",
      object = "",
    },
    misc = {
      ellipsis = "…",
      indent_marker = "│",
      last_indent_marker = "└",
      up = "⇡",
      down = "⇣",
      line = "ℓ", -- ''
      indent = "Ξ",
      tab = "⇥",
      bug = "", -- 'ﴫ'
      question = "",
      lock = "",
      -- circle = "",
      project = "",
      dashboard = "",
      history = "",
      comment = "",
      robot = "ﮧ",
      lightbulb = "",
      search = "",
      code = "",
      telescope = "",
      gear = "",
      package = "",
      list = "",
      sign_in = "",
      check = "",
      fire = "",
      note = "",
      bookmark = "",
      pencil = "",
      tools = "",
      chevron_right = "",
      double_chevron_right = "»",
      table = "",
      calendar = "",
      block = "▌",
      circle = "●",
    },
    buftype = {
      neotree = " ",
      packer = " ",
      telescope = " ",
      vista = "Ξ ",
    },
  }
  return icons
end

M.lsp = function()
  local lsp = {
    colors = {
      error = palette.pale_red,
      warn = palette.dark_orange,
      hint = palette.bright_blue,
      info = palette.teal,
    },
    kind_highlights = {
      Text = "String",
      Method = "Method",
      Function = "Function",
      Constructor = "TSConstructor",
      Field = "Field",
      Variable = "Variable",
      Class = "Class",
      Interface = "Constant",
      Module = "Include",
      Property = "Property",
      Unit = "Constant",
      Value = "Variable",
      Enum = "Type",
      Keyword = "Keyword",
      File = "Directory",
      Reference = "PreProc",
      Constant = "Constant",
      Struct = "Type",
      Snippet = "Label",
      Event = "Variable",
      Operator = "Operator",
      TypeParameter = "Type",
    },
    kind_old = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "", -- '',
      Variable = "", -- '',
      Class = "", -- '',
      Interface = "",
      Module = "", -- "", ""
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "", -- '',
      Snippet = "", -- '', '',
      Color = "",
      File = "",
      Reference = "", -- '',
      Folder = "",
      EnumMember = "",
      Constant = "", -- '',
      Struct = "", -- 'פּ',
      Event = "",
      Operator = "",
      TypeParameter = "",
    },
    kind = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "", -- '',
      Variable = "", -- '',
      Constant = "", -- '',
      Class = "",
      Interface = "",
      -- Module = "", -- "", ""
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "", -- '',
      Folder = "",
      Enum = "",
      EnumMember = "",
      Struct = "", -- 'פּ',
      Event = "",
      Operator = "",
      TypeParameter = "",
    },
    type = {
      Array = "",
      Number = "",
      String = "",
      Boolean = "蘒",
      Object = "",
    },
    ui = {
      Lock = "",
      Circle = "",
      BigCircle = "",
      BigUnfilledCircle = "",
      Close = "",
      NewFile = "",
      Search = "",
      Lightbulb = "",
      Project = "",
      Dashboard = "",
      History = "",
      Comment = "",
      Bug = "",
      Code = "",
      Telescope = "",
      Gear = "",
      Package = "",
      List = "",
      SignIn = "",
      Check = "",
      Fire = "",
      Note = "",
      BookMark = "",
      Pencil = "",
      -- ChevronRight = "",
      ChevronRight = ">",
      Table = "",
      Calendar = "",
    },
    misc = {
      Robot = "ﮧ",
      Squirrel = "",
      Tag = "",
      Watch = "",
    },
  }

  return lsp
end

M.colors = function()
  local colors = {
    background = "#24283b",
    other_background = "#1F2335",
    foreground = "#a9b1d6",
    black = "#1a1b26",
    black2 = "#1a1b26",
    red = "#f7768e",
    green = "#9ece6a",
    yellow = "#e0af68",
    blue = "#7aa2f7",
    purple = "#9d7cd8",
    cyan = "#4abaaf",
    white = "#c0caf5",
    lightgrey = "#545c7e",
    darkgrey = "#545c7e",
    lualine = "tokyonight",
    global = "tokyonight",
  }
  return colors
end

-- return { style = {
-- 		border = {
-- 			line = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
-- 			rectangle = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
-- 		},
-- 		palette = palette,
-- 	},
-- }
return M
----------------------------------------------------------------------------------------------------
-- Global style settings
----------------------------------------------------------------------------------------------------
-- Some styles can be tweaked here to apply globally i.e. by setting the current value for that style

-- The current styles for various UI elements
-- style.current = {
-- 	border = style.border.line,
-- }
