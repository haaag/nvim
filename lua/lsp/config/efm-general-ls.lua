-- Formatting Server
-- https://github.com/mattn/efm-langserver
--------------------
HOME = vim.fn.expand("$HOME")

-- Lua files
local luaFormat = {
    formatCommand = HOME .. "/.luarocks/bin/lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

-- Shell scripts
local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}
local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

-- html, css, json, yaml
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

-- Python files
local black = {formatCommand = "black -l 160 --quiet --stdin-filename", formatStdin = true}
-- local isort = {formatCommand = "isort --quiet -", formatStdin = true}

-- Lsp format server.
require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua", "sh", "python", "css", "json", "yaml", "html", "deluge"},
    settings = {
        rootMarkers = {".git/", ".venv/"},
        languages = {
            lua = {luaFormat},
            sh = {shellcheck, shfmt},
            python = {formatCommand = "black -l 160 --quiet --stdin-filename -", formatStdin = true},
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
            deluge = {},
        }
    }
}
