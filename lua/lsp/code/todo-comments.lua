local theme = require('plugins.themes.local-theme').colorscheme()
local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
    return
end

todo_comments.setup {
    signs = true, -- show icons in the signs column
    -- keywords recognized as todo comments
    keywords = {
        FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "info", -- can be a hex color, or a named color (see below)
            alt = {"FIXME", "FIXIT", "FIX", "ISSUE"} -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        TODO = {icon = " ", color = "info"},
        HACK = {icon = " ", color = "warning"},
        WARN = {icon = " ", color = "warning", alt = {"WARNING", "XXX", "SIN REGISTRO"}},
        PERF = {icon = " ", alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
        NOTE = {icon = " ", color = "hint", alt = {"INFO"}},
        COMMENT = {icon = " ", color = "hint", alt = {"INFO"}},
        WORKFLOW = {icon = " ", color = "hint", alt = {"INFO"}},
        INFO = {icon = " ", color = "hint", alt = {"INFO"}},
        VAR = {icon = "", color = "default"},
        CHECK = {icon = " ", color = "warning"},
        END = {icon = " ", color = "error"},
        BUG = {icon = " ", color = "error"},
        CHANGE = {icon = " ", color = "error"}
    },
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
        comments_only = true -- this applies the pattern only inside comments using `commentstring` option
    },
    -- list of named colors where we try to extract the guifg from the
    -- list of hilight groups or use the hex color if hl not found as a fallback
    colors = {
        error = {"LspDiagnosticsDefaultError", "ErrorMsg", theme.red},
        warning = {"LspDiagnosticsDefaultWarning", "WarningMsg", theme.yellow},
        info = {"LspDiagnosticsDefaultInformation", theme.blue},
        hint = {"LspDiagnosticsDefaultHint", theme.green},
        default = {"Identifier", theme.purple}
    },
    search = {
        command = "rg",
        args = {
            "--color=never", "--no-heading", "--with-filename", "--line-number",
            "--column"
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]] -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    }
}
