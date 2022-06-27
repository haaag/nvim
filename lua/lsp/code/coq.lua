local M = {}

function M.setup()
	local coq = require("coq")
	local icons = require("plugins.ui.styles").lsp()

	vim.g.coq_settings = {
		["auto_start"] = "shut-up",
		["keymap.pre_select"] = false,
		["display.icons.mappings"] = icons.kind,
		-- ["display.pum.kind_context"] = {"[", "]"}, -- {"「", "」"}
		["display.pum.source_context"] = { "[", "]" },
		["display.icons.mode"] = "long",
		["keymap.jump_to_mark"] = "<c-y>",
	}

	local settings = vim.g.coq_settings
	if vim.g.coq_settings.auto_start then
		-- local args = settings.auto_start == "shut-up" and { "--shut-up" } or {}
		local args = settings.auto_start == "shut-up" and { "--shut-up" }
		coq.Now(unpack(args))
	end

	-- 3party sources
	require("coq_3p")({
		{ src = "nvimlua", short_name = "api", conf_only = false }, -- Lua
		{ src = "bc", short_name = "math", precision = 6 }, -- Calculator
		{ src = "dap" },
		-- { src = "demo" },
		-- { src = "cow", trigger = "!cow" }, -- cow command
		-- { src = "figlet", trigger = "!big" }, -- figlet command
		{
			src = "repl",
			sh = "zsh",
			shell = { p = "perl", n = "node" },
			max_lines = 99,
			deadline = 500,
			unsafe = { "rm", "poweroff", "mv" },
		},
	})
end

return M
