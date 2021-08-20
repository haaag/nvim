-- Beautiful nvim-treesitter simple config.
-------------------------------------------
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "python", "javascript", "html", "bash", "lua", "json", "css", "cpp", "php", "toml", "latex"
    }, -- one of "all", "language", or a list of languages
    highlight = {
        enable = true, -- false will disable the whole extension
        indent = {enable = true},
        disable = {} -- list of language that will be disabled
        -- disable = { "c", "rust" },  -- list of language that will be disabled
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

-- windwp/nvim-ts-autotag
-------------------------
require'nvim-treesitter.configs'.setup {autotag = {enable = true}}

-- p00f/nvim-ts-rainbow
----------------------
require'nvim-treesitter.configs'.setup {rainbow = {enable = true, extended_mode = true,}}
