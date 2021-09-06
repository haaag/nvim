-- Update binds when sxhkdrc is updated.
vim.cmd [[ autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd ]]

-- Syntax highlight on rasi files
vim.cmd [[ au BufNewFile,BufRead /*.rasi setf css ]]

-- Run xrdb whenever Xdefaults or Xresources are updated.
vim.cmd [[ autocmd BufWritePost *Xresources,*Xdefaults !xrdb % ]]

-- Automatically deletes all trailing whitespace on save.
vim.cmd [[ autocmd BufWritePre * %s/\s\+$//e ]]

-- Goyo and Limelight
-- vim.cmd [[ autocmd! User GoyoEnter Limelight ]]
-- vim.cmd [[ autocmd! User GoyoLeave Limelight! ]]

-- NeoFormat
------------
vim.cmd [[ autocmd Filetype markdown nnoremap <buffer> <F7> :w<CR>:Neoformat! markdown prettier <CR> ]]
vim.cmd [[ autocmd Filetype lua nnoremap <buffer> <F7> :w<CR>:Neoformat! lua "$HOME/.luarocks/bin/lua-format -i --no-keep-simple-function-one-line --column-limit=120"<CR> ]]
-- vim.cmd [[ autocmd Filetype python nnoremap <buffer> <F7> :Format<CR> ]]

-- Syntax highlight for Deluge files
vim.cmd [[ au BufNewFile,BufRead /*.dg setf deluge ]]

-- Fold method for json files
-- vim.cmd [[ autocmd FileType json set foldmethod=expr]]
-- vim.cmd [[ autocmd FileType json set foldexpr=nvim_treesitter#foldexpr() ]]

-- sings
-- vim.cmd [[ highlight LspDiagnosticsDefaultWarning guifg='BrightRed' ]]
--

local u = require('utils')

u.define_augroups(
  {_general_settings = {
      {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'IncSearch\', timeout = 200})'},
    },
  }
)
