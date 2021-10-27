-- require('general')
-- require('keys')
-- require('lsp')
-- require('plugins.ui')
-- require('plugins')
--
-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

local modules = {
    "general",
	"keys",
	"lsp",
	"plugins.ui",
	"plugins"
}

for i = 1, #modules, 1 do
    pcall(require, modules[i])
end
