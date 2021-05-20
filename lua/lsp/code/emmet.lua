
-- emmet config
---------------

-- only enable normal mode functions.
vim.g.user_emmet_mode='n'

-- enable all functions, which is equal to
vim.g.user_emmet_mode='inv'

-- Enable only for html/css
vim.g.user_emmet_install_global = 0
vim.cmd[[ autocmd FileType html,css EmmetInstall ]]

vim.g.user_emmet_leader_key=','
