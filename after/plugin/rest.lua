local present_rest, rest_nvim = pcall(require, "rest-nvim")
if not present_rest then
	return
end

local present_wk, wk = pcall(require, "which-key")
if not present_wk then
	return
end

rest_nvim.setup({
	-- Open request results in a horizontal split
	result_split_horizontal = false,
	-- Skip SSL verification, useful for unknown certificates
	skip_ssl_verification = false,
	-- Highlight request on run
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		-- toggle showing URL, HTTP info, headers at top the of result window
		show_url = true,
		show_http_info = true,
		show_headers = true,
	},
	-- Jump to request line on run
	jump_to_request = false,
	env_file = ".env",
	custom_dynamic_variables = {},
	yank_dry_run = true,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "http",
	callback = function()
		wk.register({
			r = {
				name = "+rest",
				n = { rest_nvim.run, "RestNvim" },
				p = { rest_nvim.last, "RestNvimLast" },
				c = {
					function()
						rest_nvim.run(true)
					end,
					"RestNvimPreview (cURL)",
				},
				e = {
					"<cmd>edit ~/.config/nvim/lua/plugins/tools/rest.lua<CR>",
					"edit rest.file",
				},
			},
		}, { prefix = "<leader>" })

		wk.register({
			r = {
				name = "+rest",
				n = { rest_nvim.run, "RestNvim" },
				p = { rest_nvim.last, "RestNvimLast" },
				c = {
					function()
						rest_nvim.run(true)
					end,
					"RestNvimPreview (cURL)",
				},
			},
		}, { prefix = "<leader>", mode = "v" })
	end,
})
