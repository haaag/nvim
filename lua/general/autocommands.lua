local M = {}

M.load_autocmd = function()
	local cmd = vim.cmd
	local misc = vim.api.nvim_create_augroup("Misc", { clear = true })

	-- Update binds when sxhkdrc is updated.
	vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*sxhkdrc", command = "!pkill -USR1 sxhkd" })

	-- Syntax highlight on rasi files
	vim.api.nvim_create_autocmd("Filetype,BufNewFile,BufRead", {
		group = misc,
		pattern = "rasi",
		command = "set filetype=css",
	})

	-- Run xrdb whenever Xdefaults or Xresources are updated.
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = { "xdefaults", "Xresources" },
		command = "!xrdb %",
	})

	-- Automatically deletes all trailing whitespace on save.
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function()
			cmd([[ %s/\s\+$//e ]])
		end,
	})

	-- Highlight on Yank
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = misc,
		pattern = "*",
		callback = function()
			vim.highlight.on_yank({ on_visual = true })
		end,
	})

	--
	cmd([[ set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t ]])

	-- Disables automatic commenting on newline:
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "*",
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	})

	-- Omnicomplete
	-- cmd([[ inoremap <expr> <c-j> (\"\\<C-n>\")' ]])
	-- cmd([[ inoremap <expr> <c-k> (\"\\<C-p>\")' ]])

	-- Source luafile
	vim.api.nvim_create_autocmd("FileType", {
		group = misc,
		pattern = "lua",
		command = "nnoremap <buffer> <F5> :w<CR>:luafile %<CR>",
	})

	-- neomutt compose
	cmd([[ autocmd BufNewFile,BufRead /tmp/neomutt* set filetype=markdown ]])
	-- vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
	--     pattern = "*neomutt*",
	--     callback = function ()
	--         vim.cmd([[ set filetype=markdown ]])
	--     end
	-- })
	-- vim.api.nvim_create_autocmd("FileType", {
	-- 	group = misc,
	-- 	pattern = "neomutt*",
	-- 	callback = function()
	-- 		local data = {
	-- 			file = vim.fn.expand("<afile>"),
	-- 		}
	-- 		-- vim.cmd([[ set filetype=vimwiki ]])
	-- 		vim.schedule(function()
	-- 			print(vim.inspect(data))
	-- 		end)
	-- 	end,
	-- })

	-- markdown
	-- cmd([[ autocmd BufNewFile,BufRead *.markdown set filetype=markdown ]])

	-- alpha
	cmd([[ au ColorScheme * hi Normal ctermbg=none guibg=none ]])
end

return M
