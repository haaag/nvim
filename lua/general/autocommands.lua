local M = {}

M.load_autocmd = function()
    local cmd = vim.cmd

    -- automatically run :PackerCompile whenever plugins.lua is updated
    cmd [[ autocmd BufWritePost plugins.lua source <afile> | PackerCompile ]]

    -- Update binds when sxhkdrc is updated.
    cmd [[ autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd ]]

    -- Syntax highlight on rasi files
    cmd [[ autocmd BufNewFile,BufRead /*.rasi setf css ]]

    -- Run xrdb whenever Xdefaults or Xresources are updated.
    cmd [[ autocmd BufWritePost *Xresources,*Xdefaults !xrdb % ]]

    -- Automatically deletes all trailing whitespace on save.
    cmd [[ autocmd BufWritePre * %s/\s\+$//e ]]

    -- Syntax highlight for Deluge files
    cmd [[ autocmd BufNewFile,BufRead /*.dg setf deluge ]]

    -- Highlight on Yank
    cmd [[ autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({higroup = 'IncSearch', timeout = 600}) ]]

    cmd [[ filetype plugin on ]]
    cmd [[ set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t ]]

    -- Disables automatic commenting on newline:
    cmd [[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]]

    -- Omnicomplete
    cmd [[ inoremap <expr> <c-j> (\"\\<C-n>\")' ]]
    cmd [[ inoremap <expr> <c-k> (\"\\<C-p>\")' ]]

    -- Neoformat py
    cmd [[ autocmd Filetype python nnoremap <buffer> <F7> :w<CR>:Neoformat! python black<CR> ]]

    -- Neoformat md
    cmd [[ autocmd Filetype markdown nnoremap <buffer> <F7> :w<CR>:Neoformat! markdown prettier <CR> ]]

    -- Neoformat lua
    cmd [[ autocmd Filetype lua nnoremap <buffer> <F7> :w<CR>:Neoformat! lua "$HOME/.luarocks/bin/lua-format -i --no-keep-simple-function-one-line --column-limit=120"<CR> ]]

    -- javascript
    cmd [[ autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 ]]

    -- html
    cmd [[ autocmd FileType html setlocal shiftwidth=2 tabstop=2 ]]

    -- css
    cmd [[ autocmd FileType css setlocal shiftwidth=2 tabstop=2 ]]
end

return M
