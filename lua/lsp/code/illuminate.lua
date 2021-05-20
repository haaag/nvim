-- Highlighting is done using the same highlight groups as the builtin LSP which is LspReferenceText, LspReferenceRead, and LspReferenceWrite.
vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]

-- Time in milliseconds (default 0)
vim.g.Illuminate_delay = 0

-- Don't highlight word under cursor (default: 1)
vim.g.Illuminate_highlightUnderCursor = 1
