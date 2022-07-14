local present, dap = pcall(require, "dap")
if not present then
	return
end

local present_ui, dapui = pcall(require, "dapui")
if not present_ui then
	return
end

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

require("nvim-dap-virtual-text").setup()

-- sings
--[[ vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ü", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "ඞ", texthl = "Error" }) ]]

local signs = {
	DapBreakpoint = { text = "●", texthl = "DiagnosticSignError" },
	DapLogPoint = { text = "◉", texthl = "DiagnosticSignError" },
	DapStopped = { text = "🞂", texthl = "DiagnosticSignInfo", linehl = "CursorLine" },
}

for sign, options in pairs(signs) do
	vim.fn.sign_define(sign, options)
end

-- dapui
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- dap.adapters.python = {
-- 	type = "executable",
-- 	command = vim.loop.os_homedir() .. "/.local/debugpy/bin/python",
-- 	args = { "-m", "debugpy.adapter" },
-- }

dap.configurations.python = {
	{
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		-- program = "${workspaceFolder}/${file}", -- This configuration will launch the current file if used.
        program = '${file}',
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
				return vim.fn.exepath("python3") or vim.fn.exepath("python")
			end
		end,
	},
}
-- print(vim.inspect(dap))
-- mappings
wk.register({
	d = {
		name = "+debugging",
		X = {
			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
			"Set Breakpoint",
		},
		b = {
			"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
			"Toggle breakpoint",
		},
		B = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			"Conditional breakpoint",
		},
		r = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to cursor" },
		P = { "<cmd>lua require'dap'.repl.open()<cr>", "Repl open" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		s = {
			name = "+step",
			b = { "<cmd>lua require'dap'.step_back()<cr>", "Step back" },
			i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
			o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
			O = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
		},
		x = { "<cmd>lua require'dap'.close()<cr>", "Close" },
		p = {
			name = "+python",
			m = { "<cmd>lua require('dap-python').test_method()<CR>", "Test Method" },
			c = { "<cmd>lua require('dap-python').test_class()<CR>", "Test Clas" },
			d = { "<cmd>lua require('dap-python').debug_selection()<CR>", "Debug Selection" },
		},
	},
}, { prefix = "<leader>" })

--[[ nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR> ]]
