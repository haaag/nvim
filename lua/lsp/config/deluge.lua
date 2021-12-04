local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

local custom_attach = function(client) print("Deluge LSP started."); end

-- Syntax highlight for Deluge files
vim.cmd [[ autocmd BufNewFile,BufRead /*.dg setf deluge ]]

-- Check if it's already defined for when reloading this file.
if not lspconfig.deluge then
    configs.deluge = {
        default_config = {
            cmd = {'$HOME/apps/github/deluge/Deluge-Language-Parser/deluge-server'},
            filetypes = {'deluge'},
            root_dir = lspconfig.util.root_pattern('.git', 'deluge'),
            -- root_dir = function(fname)
            --     return lspconfig.util.find_git_ancestor(fname) or
            --     vim.loop.os_homedir()
            -- end,
            settings = {}
        }
    }
end

lspconfig.deluge.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = custom_attach
}
