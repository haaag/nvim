-- VimWiki
----------
local HOME = tostring(os.getenv("HOME"))
local g = vim.g

-- g.vimwiki_ext2syntax = {
--   ['.md'] = 'markdown',
--   ['.markdown'] = 'markdown',
--   ['.mdown'] = 'markdown',
-- }

g.vimwiki_list = {
    path = HOME .. "/apps/vimwiki/",
    index = "main",
    sytax = "markdown",
    ext = "md",
    auto_diary_index = 1,
    auto_toc = 1,
    auto_generte_links = 1
}

vim.g.vimwiki_markdown_link_ext = 1
vim.g.taskwiki_markup_syntax = 'markdown'
vim.g.markdown_folding = 1
