local M = {}

M.load_autocmd = function()
	local api = vim.api
	local cmd = vim.cmd
	local misc = vim.api.nvim_create_augroup("Misc", { clear = true })

	-- Update binds when sxhkdrc is updated.
	api.nvim_create_autocmd("BufWritePost", { pattern = "*sxhkdrc", command = "!pkill -USR1 sxhkd" })

	-- Syntax highlight on rasi files
	api.nvim_create_autocmd("Filetype,BufNewFile,BufRead", {
		group = misc,
		pattern = "rasi",
		command = "set filetype=css",
	})

	-- Run xrdb whenever Xdefaults or Xresources are updated.
	api.nvim_create_autocmd("BufWritePost", {
		pattern = { "xdefaults", "Xresources" },
		command = "!xrdb %",
	})

	-- windows to close with "q"
	api.nvim_create_autocmd("FileType", {
		pattern = { "help", "startuptime", "qf", "lspinfo" },
		command = [[nnoremap <buffer><silent> q :close<CR>]],
	})

	-- man pager
	api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

	-- show cursor line only in active window
	local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
	api.nvim_create_autocmd(
		{ "InsertLeave", "WinEnter" },
		{ pattern = "*", command = "set cursorline", group = cursorGrp }
	)
	api.nvim_create_autocmd(
		{ "InsertEnter", "WinLeave" },
		{ pattern = "*", command = "set nocursorline", group = cursorGrp }
	)

	-- Automatically deletes all trailing whitespace on save.
	api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function()
			cmd([[ %s/\s\+$//e ]])
		end,
	})

	-- Highlight on Yank
	api.nvim_create_autocmd("TextYankPost", {
		group = misc,
		callback = function()
			vim.highlight.on_yank({ on_visual = true })
		end,
	})

	-- go to last loc when opening a buffer
	api.nvim_create_autocmd(
		"BufReadPost",
		{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
	)

	--
	-- cmd([[ set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t ]])

	-- Disables automatic commenting on newline:
	api.nvim_create_autocmd("FileType", {
		pattern = "*",
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	})

	-- Source luafile
	api.nvim_create_autocmd("FileType", {
		group = misc,
		pattern = "lua",
		command = "nnoremap <buffer> <F5> :w<CR>:luafile %<CR>",
	})

	-- neomutt compose
	-- TODO: Update neomutt au to nvim_create_autocmd
	cmd([[ autocmd BufNewFile,BufRead /tmp/neomutt* set filetype=markdown ]])

	-- markdown
	-- cmd([[ autocmd BufNewFile,BufRead *.markdown set filetype=markdown ]])

	-- alpha
	cmd([[ au ColorScheme * hi Normal ctermbg=none guibg=none ]])
end

return M
