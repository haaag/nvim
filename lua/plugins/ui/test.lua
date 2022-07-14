local extract_hl = function(hl, fore)
    return ("#%06x"):format(
        vim.api.nvim_get_hl_by_name(hl, true)[fore and 'background' or 'foreground'] or 255
    )
end
-- local test = vim.api.nvim_get_hl_by_name("StalinePavel", true)
-- vim.pretty_print(test)
vim.pretty_print(extract_hl("StalinePavel"))
