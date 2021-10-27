-- nvim-cmp config
vim.opt.completeopt = {"menu", "menuone", "noselect"}
vim.opt.shortmess:append "c"

local cmd = vim.cmd
-- cmd [[ packadd nvim-cmp ]]
cmd [[ packadd lspkind-nvim ]]
-- cmd [[ packadd cmp-vsnip ]]
-- cmd [[ packadd cmp-nvim-lsp ]]
-- cmd [[ packadd cmp-buffer ]]
-- cmd [[ packadd cmp-path ]]
-- cmd [[ packadd cmp-spell ]]
-- cmd [[ packadd friendly-snippets ]]

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Setup nvim-cmp.
local cmp = require 'cmp'
local lspkind = require('lspkind')

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
        { name = 'path' },
        { name = 'spell' }
    },
    formatting = {format = lspkind.cmp_format({
        with_text = true,
        menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[api]",
            path = "[path]",
            vsnip = "[snip]",
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

-- cmd [[highlight! link CmpItemAbbr Pmenu]]
-- cmd [[highlight! link CmpItemKind Pmenu]]
-- cmd [[highlight! link CmpItemMenu Pmenu]]
