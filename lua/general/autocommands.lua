local M = {}

M.load_autocmd = function()
	local cmd = vim.cmd
	local misc = vim.api.nvim_create_augroup("Misc", { clear = true })

	-- automatically run :PackerCompile whenever plugins.lua is updated
	-- cmd [[ autocmd BufWritePost plugins.lua source <afile> | PackerCompile ]]

	-- Update binds when sxhkdrc is updated.
	-- cmd [[ autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd ]]
	vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*sxhkdrc", command = "!pkill -USR1 sxhkd" })

	-- Syntax highlight on rasi files
	cmd([[ autocmd BufNewFile,BufRead /*.rasi setf css ]])
	-- vim.api.nvim_create_autocmd("Filetype,BufNewFile,BufRead", {
	-- 	group = misc,
	--     pattern = "rasi",
	--     callback = function ()
	--         vim.cmd[[ set filetype=css ]]
	--     end
	-- })

	-- Run xrdb whenever Xdefaults or Xresources are updated.
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = { "xdefaults", "Xresources" },
		command = "!xrdb %",
	})

	-- Automatically deletes all trailing whitespace on save.
	cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])

	-- Highlight on Yank
	-- cmd([[ autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({higroup = 'IncSearch', timeout = 300}) ]])
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = misc,
		pattern = "*",
		callback = function()
			vim.highlight.on_yank({ on_visual = true })
		end,
	})

	-- cmd [[ filetype plugin on ]]
	cmd([[ set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t ]])

	-- Disables automatic commenting on newline:
	cmd([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]])

	-- Omnicomplete
	cmd([[ inoremap <expr> <c-j> (\"\\<C-n>\")' ]])
	cmd([[ inoremap <expr> <c-k> (\"\\<C-p>\")' ]])

	-- Source luafile
	cmd([[ autocmd Filetype lua nnoremap <buffer> <F5> :w<CR>:luafile %<CR> ]])

	-- neomutt compose
	cmd([[ autocmd BufNewFile,BufRead /tmp/neomutt* set filetype=markdown ]])
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


	-- dwmblocks
	-- cmd [[ autocmd BufWritePost ~/apps/suckless/dwmblocks/config.h !cd ~/apps/suckless/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & } ]]
end

return M
