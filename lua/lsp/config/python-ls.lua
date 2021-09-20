--- python lsp simple config
----------------------------
local HOME = vim.loop.os_homedir()
local lsp = require 'lspconfig'
local custom_attach = function(client)
    print("Python LSP started.");
end

lsp.pyright.setup{on_attach=custom_attach}

-- vim.g.python3_host_prog = 'python3'
vim.g.python3_host_prog = HOME .. '/.local/debugpy/bin/python';

-- no python2
vim.g.loaded_python_provider = 0

vim.cmd [[  ]]
