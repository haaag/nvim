local COQ = {}

function COQ.setup()
    local icons = require("me.ui.styles").lsp()

    vim.g.coq_settings = {
        auto_start = "shut-up",
        keymap = {
            pre_select = true,
            jump_to_mark = "<c-y>",
        },
        display = {
            icons = {
                mode = "long",
                mappings = icons.kind,
            },
            pum = {
                source_context = { "[", "]" },
            },
        },
        clients = {
            tags = {
                enabled = true,
                short_name = "TAGS",
            },
            buffers = {
                same_filetype = true,
            },
        },
    }

    -- 3party sources
    require("coq_3p")({
        { src = "nvimlua", short_name = "api", conf_only = false }, -- Lua
        { src = "bc", short_name = "math", precision = 6 }, -- Calculator
        { src = "figlet", trigger = "!big" }, -- figlet command
        {
            src = "repl",
            sh = "zsh",
            shell = { p = "perl", n = "node" },
            max_lines = 99,
            deadline = 500,
            unsafe = { "rm", "poweroff", "mv" },
        },
    })
end

return COQ
