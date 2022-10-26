local M = {}

M.lsp_keys = function(bufnr)
	local buff_map = vim.api.nvim_buf_set_keymap

	buff_map(
		bufnr,
		"n",
		"gD",
		"<cmd>lua vim.lsp.buf.declaration()<CR>",
		{ noremap = true, silent = true, desc = "LSP declaration" }
	)

	buff_map(
		bufnr,
		"n",
		"gd",
		"<cmd>lua vim.lsp.buf.definition()<CR>",
		{ noremap = true, silent = true, desc = "LSP definition" }
	)

	buff_map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "LSP hover" })

	buff_map(
		bufnr,
		"n",
		"gi",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		{ noremap = true, silent = true, desc = "LSP implementation" }
	)

	buff_map(
		bufnr,
		"n",
		"<C-k>",
		"<cmd>lua vim.lsp.buf.signature_help()<CR>",
		{ noremap = true, silent = true, desc = "LSP signature help" }
	)

	buff_map(
		bufnr,
		"n",
		"<leader>wa",
		"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
		{ noremap = true, silent = true, desc = "Add workspace folder" }
	)

	buff_map(
		bufnr,
		"n",
		"<leader>wr",
		"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
		{ noremap = true, silent = true, desc = "Remove workspace folder" }
	)

	buff_map(
		bufnr,
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		{ noremap = true, silent = true, desc = "List workspace folders" }
	)

	buff_map(
		bufnr,
		"n",
		"<leader>D",
		"<cmd>lua vim.lsp.buf.type_definition()<CR>",
		{ noremap = true, silent = true, desc = "Type definition" }
	)

	buff_map(
		bufnr,
		"n",
		"gr",
		"<cmd>lua vim.lsp.buf.references()<CR>",
		{ noremap = true, silent = true, desc = "References" }
	)

	buff_map(
		bufnr,
		"n",
		"<leader>lf",
		"<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>",
		{ noremap = true, silent = true, desc = "Format" }
	)

	buff_map(
		bufnr,
		"n",
		"<leader>la",
		"<cmd>lua vim.lsp.buf.code_action()<CR>",
		{ noremap = true, silent = true, desc = "Code action" }
	)

	buff_map(
		bufnr,
		"n",
		"<leader>lc",
		"<cmd>Telescope lsp_references<CR>",
		{ noremap = true, silent = true, desc = "Telescope references" }
	)

	buff_map(
		bufnr,
		"n",
		"<space>lr",
		"<cmd>lua vim.lsp.buf.rename()<CR>",
		{ noremap = true, silent = true, desc = "LSP Rename" }
	)

	buff_map(bufnr, "n", "<leader>lT", "<cmd>TodoTelescope<CR>", { noremap = true, silent = true, desc = "Todos" })

	-- diagnostic
	buff_map(
		bufnr,
		"n",
		"[d",
		"<CMD>lua vim.diagnostic.goto_prev()<CR>",
		{ noremap = true, silent = true, desc = "Diag. Prev" }
	)

	buff_map(
		bufnr,
		"n",
		"]d",
		"<CMD>lua vim.diagnostic.goto_next()<CR>",
		{ noremap = true, silent = true, desc = "Diag. Next" }
	)

	buff_map(
		bufnr,
		"n",
		"]a",
		"<CMD>lua vim.diagnostic.open_float()<CR>",
		{ noremap = true, silent = true, desc = "Diag. Float" }
	)

	buff_map(bufnr, "n", "<leader>ld", "<CMD>Neogen<CR>", { noremap = true, silent = true, desc = "Diag. Float" })
end

return M
