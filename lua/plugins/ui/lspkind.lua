-- https://github.com/yamatsum/nvim-nonicons
-- https://github.com/yamatsum/nonicons/tree/master/dist
require('lspkind').init({
    with_text = true,
    symbol_map = {
        Text = '',
        Method = '',
        Function = '',
        Constructor = '',
        Variable = '',
        Class = '',
        Interface = '',
        -- Module = '',
        Module = '{}',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '',
        Color = '',
        File = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = '',
        Field = '',
        Event = '',
        TypeParameter = '',
        Operator = '',
        Reference = ''
    }
})
