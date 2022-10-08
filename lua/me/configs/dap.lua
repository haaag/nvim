local dap = require("dap")
local wk = require("which-key")

require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local DAP = {}

DAP.setup = function()
	-- mappings
	wk.register({
		d = {
			name = "+debugging",
			b = {
				"<CMD>lua require'dap'.toggle_breakpoint()<CR>",
				"Toggle breakpoint",
			},
			B = {
				"<CMD>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
				"Conditional breakpoint",
			},
			c = { "<CMD>lua require'dap'.continue()<CR>", "Continue" },
			r = { "<CMD>lua require'dap'.run_to_cursor()<CR>", "Run to cursor" },
			P = { "<CMD>lua require'dap'.repl.open()<CR>", "Repl open" },
			p = {
				name = "+python",
				m = { "<CMD>lua require('dap-python').test_method()<CR>", "Test Method" },
				c = { "<CMD>lua require('dap-python').test_class()<CR>", "Test Class" },
				d = { "<CMD>lua require('dap-python').debug_selection()<CR>", "Debug Selection" },
			},
			u = {
				name = "+ui",
				o = { "<CMD>lua require('dapui').open()<CR>", "Open UI" },
				O = { "<CMD>lua require('dapui').toggle()<CR>", "Toggle UI" },
				c = { "<CMD>lua require('dapui').close()<CR>", "Close UI" },
			},
			s = {
				name = "+step",
				b = { "<CMD>lua require'dap'.step_back()<CR>", "Step back" },
				i = { "<CMD>lua require'dap'.step_into()<CR>", "Step into" },
				o = { "<CMD>lua require'dap'.step_over()<CR>", "Step over" },
				O = { "<CMD>lua require'dap'.step_out()<CR>", "Step out" },
			},
			x = { "<CMD>lua require'dap'.close()<CR>", "Close" },
			X = {
				"<CMD>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
				"Set Breakpoint",
			},
		},
	}, { prefix = "<leader>" })

	local breakpoint = {
		-- text = "",
		text = "",
		texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	}

	vim.fn.sign_define("DapBreakpoint", breakpoint)
	dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

	dap.adapters.python = {
		type = "executable",
		command = vim.loop.os_homedir() .. "/.local/debugpy/bin/python",
		args = { "-m", "debugpy.adapter" },
	}

	dap.configurations.python = {
		{
			-- The first three options are required by nvim-dap
			type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
			request = "launch",
			name = "Launch file",

			-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

			program = "${file}", -- This configuration will launch the current file if used.
			pythonPath = function()
				-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
				-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
				-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
				local cwd = vim.fn.getcwd()
				if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
					return cwd .. "/venv/bin/python"
				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
					return cwd .. "/.venv/bin/python"
				else
					return "/usr/bin/python"
				end
			end,
		},
	}
end

return DAP
