-- nvim-cmp config
------------------
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local lspkind = require('lspkind')
local theme = require('plugins.themes.theme-colors').colors()
vim.opt.completeopt = {"menu", "menuone", "noselect"}
vim.opt.shortmess:append "c"

local cmd = vim.cmd
-- cmd [[ packadd lspkind-nvim ]]

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    snippet = {expand = function(args) vim.fn["vsnip#anonymous"](args.body) end},
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
        ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        -- vsnip
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"]() == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, {"i", "s"})
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua'  },
        { name = 'buffer', keyword_length = 5 },
        { name = 'vsnip' },
        { name = 'rg', keyword_length = 5 },
        { name = 'path' },
        { name = 'spell' }
    },
    formatting = {format = lspkind.cmp_format({
        with_text = true,
        menu = {
            buffer = "[buf]",
            nvim_lsp = "[lsp]",
            nvim_lua = "[api]",
            path = "[path]",
            vsnip = "[snip]",
            rg = "[rg]",
      },
    })},
    experimental = {
        -- I like the new menu better! Nice work hrsh7th
        native_menu = false,

        -- Let's play with this for a day or two
        ghost_text = true
    },
    sorting = {
        comparators = {
            require "cmp-under-comparator".under
        }
    }
})


--
cmd('highlight! CmpItemKindText guibg=NONE guifg=' .. theme.cyan)
cmd('highlight! CmpItemAbbrMatch guibg=NONE guifg=' .. theme.blue)
cmd('highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=' .. theme.blue)
cmd('highlight! CmpItemKind guibg=NONE guifg=' .. theme.purple)
cmd('highlight! CmpItemKindFunction guibg=NONE guifg=' .. theme.purple)
cmd('highlight! CmpItemKindKeyword guibg=NONE guifg=' .. theme.white)
cmd('highlight! CmpItemKindVariable guibg=NONE guifg=' .. theme.yellow)
cmd('highlight! CmpItemKindMethod guibg=NONE guifg=' .. theme.purple)


--[[
lsp.CompletionItemKind = {}
lsp.CompletionItemKind.Text = 1
lsp.CompletionItemKind.Method = 2
lsp.CompletionItemKind.Function = 3
lsp.CompletionItemKind.Constructor = 4
lsp.CompletionItemKind.Field = 5
lsp.CompletionItemKind.Variable = 6
lsp.CompletionItemKind.Class = 7
lsp.CompletionItemKind.Interface = 8
lsp.CompletionItemKind.Module = 9
lsp.CompletionItemKind.Property = 10
lsp.CompletionItemKind.Unit = 11
lsp.CompletionItemKind.Value = 12
lsp.CompletionItemKind.Enum = 13
lsp.CompletionItemKind.Keyword = 14
lsp.CompletionItemKind.Snippet = 15
lsp.CompletionItemKind.Color = 16
lsp.CompletionItemKind.File = 17
lsp.CompletionItemKind.Reference = 18
lsp.CompletionItemKind.Folder = 19
lsp.CompletionItemKind.EnumMember = 20
lsp.CompletionItemKind.Constant = 21
lsp.CompletionItemKind.Struct = 22
lsp.CompletionItemKind.Event = 23
lsp.CompletionItemKind.Operator = 24
lsp.CompletionItemKind.TypeParameter = 25
lsp.CompletionItemKind = vim.tbl_add_reverse_lookup(lsp.CompletionItemKind) ]]

