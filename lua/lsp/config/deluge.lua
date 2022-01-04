-- deluge zoho
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end
local configs = require 'lspconfig.configs'

local custom_attach = function(client)
    print("Attached to " .. client.name);
end

-- Syntax highlight for Deluge files
vim.cmd [[ autocmd BufNewFile,BufRead /*.dg setf deluge ]]

-- Check if it's already defined for when reloading this file.
if not configs.deluge then
    configs.deluge = {
        default_config = {
            cmd = {'/home/hh/apps/github/deluge/Deluge-Language-Parser/deluge-server'},
            filetypes = {'deluge'},
            root_dir = lsp.util.root_pattern('.git', 'deluge', 'projects'),
            --[[ root_dir = function(fname)
                return lsp.util.find_git_ancestor(fname) or
                vim.loop.os_homedir()
            end, ]]
            settings = {}
        }
    }
end

lsp.deluge.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = custom_attach
}
