--- Json lsp simple config
---------------------
local lsp = require('lspconfig')
local custom_attach = function(client) print("Json LSP started."); end

local capabilities = require('cmp_nvim_lsp').update_capabilities(
                         vim.lsp.protocol.make_client_capabilities())

-- lsp.jsonls.setup{
--     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     on_attach=custom_attach
-- }

lsp.jsonls.setup {
    cmd = {"vscode-json-language-server", "--stdio"},
    on_attach = custom_attach,
    capabilities = capabilities,
    filetypes = {"json", "jsonc"},
    settings = {
        json = {
            -- Schemas https://www.schemastore.org
            schemas = {
                {
                    fileMatch = {"package.json"},
                    url = "https://json.schemastore.org/package.json"
                }, {
                    fileMatch = {"tsconfig*.json"},
                    url = "https://json.schemastore.org/tsconfig.json"
                }, {
                    fileMatch = {
                        ".prettierrc", ".prettierrc.json",
                        "prettier.config.json"
                    },
                    url = "https://json.schemastore.org/prettierrc.json"
                }, {
                    fileMatch = {".eslintrc", ".eslintrc.json"},
                    url = "https://json.schemastore.org/eslintrc.json"
                }, {
                    fileMatch = {
                        ".babelrc", ".babelrc.json", "babel.config.json"
                    },
                    url = "https://json.schemastore.org/babelrc.json"
                },
                {
                    fileMatch = {"lerna.json"},
                    url = "https://json.schemastore.org/lerna.json"
                }, {
                    fileMatch = {"now.json", "vercel.json"},
                    url = "https://json.schemastore.org/now.json"
                }, {
                    fileMatch = {
                        ".stylelintrc", ".stylelintrc.json",
                        "stylelint.config.json"
                    },
                    url = "http://json.schemastore.org/stylelintrc.json"
                }
            }
        }
    }
}
