-- nvim-cmp config
------------------
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end

local icons = require("plugins.ui.styles").lsp()
local colors = require("plugins.themes.theme-colors").colors()
local cmd = vim.cmd

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
		-- completion = {
		-- 	completeopt = "menu,menuone,noinsert",
		-- 	keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
		-- 	keyword_length = 2,
		-- },
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- ["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<c-y>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }
		),
		-- vsnip
		["<C-k>"] = cmp.mapping(function(fallback)
			-- ["<c-y>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"]() == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
		["<C-j>"] = cmp.mapping(function()
			-- ["<S-C-y>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		["<c-q>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-Space>"] = cmp.mapping({
			i = cmp.mapping.complete(),
			c = function(
				_ --[[fallback]]
			)
				if cmp.visible() then
					if not cmp.confirm({ select = true }) then
						return
					end
				else
					cmp.complete()
				end
			end,
		}),
	},
	sources = {
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
        { name = "vsnip" },
		{ name = "path" },
		{ name = "spell" },
        { name = "rg", keyword_length = 5 },
        { name = "buffer", keyword_length = 5 },
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- vim_item.menu = vim_item.kind
			vim_item.menu = ({
				nvim_lsp = "[lsp]",
				nvim_lua = "[api]",
				vsnip = "[snip]",
				path = "[path]",
				buffer = "[buf]",
				rg = "[rg]",
			})[entry.source.name]
			-- vim_item.kind = icons.kind[vim_item.kind] .. ' '
			vim_item.kind = icons.kind[vim_item.kind] .. ' '

			return vim_item
		end,
	},
	--[[ formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", icons.kind[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				nvim_lsp = "[lsp]",
				nvim_lua = "[api]",
                vsnip = "[snip]",
				path = "[path]",
                buffer = "[buf]",
				rg = "[rg]",
			})[entry.source.name]
			return vim_item
		end,
	}, ]]
	experimental = {
		-- I like the new menu better! Nice work hrsh7th
		native_menu = false,

		-- Let's play with this for a day or two
		ghost_text = true,
	},
	sorting = {
		comparators = {
			require("cmp-under-comparator").under,
		},
	},
})

cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")

cmd("highlight! CmpItemKindText guibg=NONE guifg=" .. colors.cyan)
cmd("highlight! CmpItemKindInterface guibg=NONE guifg=" .. colors.yellow)
cmd("highlight! CmpItemKindVariable guibg=NONE guifg=" .. colors.yellow)
cmd("highlight! CmpItemKindClass guibg=NONE guifg=" .. colors.yellow)

cmd("highlight! CmpItemAbbrMatch guibg=NONE guifg=" .. colors.blue)
cmd("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=" .. colors.blue)

cmd("highlight! CmpItemKind guibg=NONE guifg=" .. colors.purple)
cmd("highlight! CmpItemKindFunction guibg=NONE guifg=" .. colors.purple)
cmd("highlight! CmpItemKindKeyword guibg=NONE guifg=" .. colors.white)
cmd("highlight! CmpItemKindProperty guibg=NONE guifg=" .. colors.white)
cmd("highlight! CmpItemKindUnit guibg=NONE guifg=" .. colors.white)

cmd("highlight! CmpItemKindMethod guibg=NONE guifg=" .. colors.purple)



--[[ vim.api.nvim_create_autocmd(
  {"TextChangedI", "TextChangedP"},
  {
    callback = function()
      local line = vim.api.nvim_get_current_line()
      local cursor = vim.api.nvim_win_get_cursor(0)[2]

      local current = string.sub(line, cursor, cursor + 1)
      if current == "." or current == "," or current == " " then
        require('cmp').close()
      end

      local before_line = string.sub(line, 1, cursor + 1)
      local after_line = string.sub(line, cursor + 1, -1)
      if not string.match(before_line, '^%s+$') then
        if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
          require('cmp').complete()
        end
      end
  end,
  pattern = "*"
}) ]]

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

--[[ formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[lsp]",
				nvim_lua = "[api]",
				path = "[path]",
				vsnip = "[snip]",
				rg = "[rg]",
			},
		}),
	}, ]]
