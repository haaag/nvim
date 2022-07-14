local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
	return
end

local lsp_icons = require("plugins.ui.styles").lsp()

-- Customized config
gps.setup({

	disable_icons = false, -- Setting it to true will disable all icons

	icons = {
		["class-name"] = "%#CmpItemKindClass#" .. lsp_icons.kind.Class .. " %*" .. "", -- Classes and class-like objects
		["function-name"] = "%#CmpItemKindFunction#" .. lsp_icons.kind.Function .. " %*"  .. "", -- Functions
		["method-name"] = "%#CmpItemKindMethod#" .. lsp_icons.kind.Method .. " %*"  .. "", -- Methods (functions inside class-like objects)
		["container-name"] = "%#CmpItemKindProperty#" .. lsp_icons.type.Object .. " %*"  .. "", -- Containers (example: lua tables)
		["tag-name"] = "%#CmpItemKindKeyword#" .. lsp_icons.misc.Tag .. " %*"  .. " ", -- Tags (example: html tags)
		["mapping-name"] = "%#CmpItemKindProperty#" .. lsp_icons.type.Object .. " %*"  .. "",
		["sequence-name"] = "%CmpItemKindProperty#" .. lsp_icons.type.Array .. " %*"  .. "",
		["null-name"] = "%CmpItemKindField#" .. lsp_icons.kind.Field .. " %*"  .. "",
		["boolean-name"] = "%CmpItemKindValue#" .. lsp_icons.type.Boolean .. " %*"  .. "",
		["integer-name"] = "%CmpItemKindValue#" .. lsp_icons.type.Number .. " %*"  .. "",
		["float-name"] = "%CmpItemKindValue#" .. lsp_icons.type.Number .. " %*"  .. "",
		["string-name"] = "%CmpItemKindValue#" .. lsp_icons.type.String .. " %*"  .. "",
		["array-name"] = "%CmpItemKindProperty#" .. lsp_icons.type.Array .. " %*"  .. "",
		["object-name"] = "%CmpItemKindProperty#" .. lsp_icons.type.Object .. " %*"  .. "",
		["number-name"] = "%CmpItemKindValue#" .. lsp_icons.type.Number .. " %*"  .. "",
		["table-name"] = "%CmpItemKindProperty#" .. lsp_icons.ui.Table .. " %*"  .. "",
		["date-name"] = "%CmpItemKindValue#" .. lsp_icons.ui.Calendar .. " %*"  .. "",
		["date-time-name"] = "%CmpItemKindValue#" .. lsp_icons.ui.Table .. " %*"  .. "",
		["inline-table-name"] = "%CmpItemKindProperty#" .. lsp_icons.ui.Calendar .. " %*"  .. "",
		["time-name"] = "%CmpItemKindValue#" .. lsp_icons.misc.Watch .. " %*"  .. "",
		["module-name"] = "%CmpItemKindModule#" .. lsp_icons.kind.Module .. " %*"  .. "",
	},

	separator = " " .. lsp_icons.ui.ChevronRight .. " ",

	-- limit for amount of context shown
	-- 0 means no limit
	-- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
	-- in context names (eg: function names, class names, etc)
	depth = 0,

	-- indicator used when context is hits depth limit
	depth_limit_indicator = "..",
	text_hl = "LineNr",
})
