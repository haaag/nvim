-- vim-matchup

vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*",
    command = "hi MatchWord ctermfg=red guifg=#458588 cterm=underline gui=underline"
})
