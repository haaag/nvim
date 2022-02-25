local M = {}

M.load_autocmd = function()
    local cmd = vim.cmd

    -- automatically run :PackerCompile whenever plugins.lua is updated
    -- cmd [[ autocmd BufWritePost plugins.lua source <afile> | PackerCompile ]]

    -- Update binds when sxhkdrc is updated.
    cmd [[ autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd ]]

    -- Syntax highlight on rasi files
    cmd [[ autocmd BufNewFile,BufRead /*.rasi setf css ]]

    -- Run xrdb whenever Xdefaults or Xresources are updated.
    cmd [[ autocmd BufWritePost *Xresources,*Xdefaults !xrdb % ]]

    -- Automatically deletes all trailing whitespace on save.
    cmd [[ autocmd BufWritePre * %s/\s\+$//e ]]

    -- Highlight on Yank
    cmd [[ autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({higroup = 'IncSearch', timeout = 300}) ]]

    -- cmd [[ filetype plugin on ]]
    cmd [[ set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t ]]

    -- Disables automatic commenting on newline:
    cmd [[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]]

    -- Omnicomplete
    cmd [[ inoremap <expr> <c-j> (\"\\<C-n>\")' ]]
    cmd [[ inoremap <expr> <c-k> (\"\\<C-p>\")' ]]

    -- Source luafile
    cmd [[ autocmd Filetype lua nnoremap <buffer> <F5> :w<CR>:luafile %<CR> ]]

    -- xprofile
    cmd [[ autocmd BufNewFile,BufRead /*.xprofile setf sh ]]

    -- neomutt compose
    cmd [[ autocmd BufNewFile,BufRead /tmp/neomutt* set filetype=vimwiki ]]

end

return M
