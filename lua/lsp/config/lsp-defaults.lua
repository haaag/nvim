local M = {}

M.custom_attach = function(client, bufnr)
	local api = vim.api
	require("keys.mappings").lsp_keys(bufnr)

	api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
			}

			if not vim.b.diagnostics_pos then
				vim.b.diagnostics_pos = { nil, nil }
			end

			local cursor_pos = vim.api.nvim_win_get_cursor(0)
			if
				(cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
				and #vim.diagnostic.get() > 0
			then
				vim.diagnostic.open_float(nil, opts)
			end

			vim.b.diagnostics_pos = cursor_pos
		end,
	})

	local rc = client.server_capabilities

	if client.name == "pylsp" then
		rc.rename = false
		rc.renameProvider = false
		rc.completion = false
	end

	if client.name == "pyright" then
		rc.hoverProvider = false
		rc.definition = false
		rc.signature_help = false
		rc.signatureHelpProvider = false
	end

	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end

	print("attached to " .. client.name)
end

M.capabilities = function()
	local present_coq, coq = pcall(require, "coq")
	if present_coq then
		local capabilities = coq.lsp_ensure_capabilities({})
		return capabilities
	end

	local present_cmp, cmp = pcall(require, "cmp_nvim_lsp")
	if present_cmp then
        local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = cmp.update_capabilities(capabilities)
		return capabilities
	end
end

return M
