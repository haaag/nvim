-- VimWiki
----------
print("vimwiki")
local g = vim.g

-- g.vimwiki_ext2syntax = {.md = 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
g.vimwiki_list = {{path = '~/apps/vimwiki', syntax = 'markdown', ext = '.md'}}
