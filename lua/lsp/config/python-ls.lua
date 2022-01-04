--- python lsp simple config
----------------------------
local cmd = vim.cmd
local HOME = vim.loop.os_homedir()
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- Neoformat py
cmd [[ autocmd Filetype python nnoremap <buffer> <F7> :w<CR>:Neoformat! python black<CR> ]]

local custom_attach = function(client)
    print("Attached to " .. client.name);
end

-- pyright
lsp.pyright.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach=custom_attach,
}

-- pylsp
-- lsp.pylsp.setup{
--     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     on_attach=custom_attach,
-- }

-- vim.g.python3_host_prog = 'python3'
vim.g.python3_host_prog = HOME .. '/.local/debugpy/bin/python';

-- no python2
vim.g.loaded_python_provider = 0

vim.cmd [[  ]]
