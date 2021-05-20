local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
-- Check if it's already defined for when reloading this file.
if not lspconfig.deluge then
  configs.deluge = {
    default_config = {
      cmd = {'/home/hh/apps/github/deluge/Deluge-Language-Parser/deluge'};
      filetypes = {'deluge'};
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end;
      settings = {};
    };
  }
end

local custom_attach = function(client)
    print("Deluge LSP started.");
end
lspconfig.deluge.setup{on_attach=custom_attach}
