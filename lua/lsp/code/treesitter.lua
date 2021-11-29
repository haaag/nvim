-- beautiful nvim-treesitter simple config.
local theme = require('plugins.themes.local-theme').colorscheme()

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "python", "javascript", "html", "bash", "lua", "json", "css", "cpp",
        "php", "toml", "latex", "typescript"
    }, -- one of "all", "language", or a list of languages
    highlight = {
        enable = true, -- false will disable the whole extension
        indent = {enable = false},
        -- disable = {} -- list of language that will be disabled
        disable = {"c", "rust"} -- list of language that will be disabled
    }
}

-- Text objects: select
-- Define your own text objects mappings similar to ip (inner paragraph) and ap (a paragraph).
require'nvim-treesitter.configs'.setup {
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                -- Or you can define your own textobjects like this
                ["iF"] = {
                    python = "(function_definition) @function",
                    cpp = "(function_definition) @function",
                    c = "(function_definition) @function",
                    java = "(method_declaration) @function"
                }
            }
        }
    }
}

-- Textobjects: LSP interop
-- peek_definition_code: show textobject surrounding definition as determined using Neovim's built-in LSP in a floating window.
-- Press the shortcut twice to enter the floating window (when https://github.com/neovim/neovim/pull/12720 or its successor is merged)

require'nvim-treesitter.configs'.setup {
    textobjects = {
        lsp_interop = {
            enable = true,
            peek_definition_code = {
                ["df"] = "@function.outer",
                ["dF"] = "@class.outer"
            }
        }
    }
}

-- Use treesitter to autoclose and autorename html tag
-- windwp/nvim-ts-autotag
require'nvim-treesitter.configs'.setup {autotag = {enable = true}}

-- Incremental selection based on the named nodes from the grammar.
require'nvim-treesitter.configs'.setup {
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    }
}

-- nvim-ts-context-commentstring
require'nvim-treesitter.configs'.setup {context_commentstring = {enable = true}}

-- p00f/nvim-ts-rainbow
require'nvim-treesitter.configs'.setup {
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        colors = {
            theme.red, theme.yellow, theme.blue, theme.purple,
            theme.cyan
        },
        max_file_lines = nil -- Do not enable for files with more than n lines, int
        -- termcolors = {} -- table of colour name strings
    }
}
