-- Beautiful nvim-treesitter simple config.
-------------------------------------------
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "python", "javascript", "html", "bash", "lua", "json", "css", "cpp",
        "php", "toml", "latex"
    }, -- one of "all", "language", or a list of languages
    highlight = {
        enable = true, -- false will disable the whole extension
        indent = {enable = true},
        -- disable = {} -- list of language that will be disabled
        disable = { "c", "rust" }  -- list of language that will be disabled
    }
}

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
--     peek_definition_code: show textobject surrounding definition as determined using Neovim's built-in LSP in a floating window. Press the shortcut twice to enter the floating window (when https://github.com/neovim/neovim/pull/12720 or its successor is merged)

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

--[[ require"nvim-treesitter.configs".setup {
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    }
} ]]

-- Incremental selection based on the named nodes from the grammar.
--[[ require'nvim-treesitter.configs'.setup {
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    }
} ]]

-- windwp/nvim-ts-autotag
-------------------------
-- require'nvim-treesitter.configs'.setup {autotag = {enable = true}}

-- p00f/nvim-ts-rainbow
----------------------
-- require'nvim-treesitter.configs'.setup {rainbow = {enable = true, extended_mode = true,}}
