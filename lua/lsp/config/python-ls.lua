--- python lsp simple config
----------------------------

local lsp = require 'lspconfig'
local custom_attach = function(client)
    print("Python LSP started.");
end

lsp.pyright.setup{on_attach=custom_attach}

vim.g.python3_host_prog = 'python3'

-- no python2
vim.g.loaded_python_provider = 0

vim.cmd [[  ]]
