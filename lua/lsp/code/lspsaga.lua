local saga = require 'lspsaga'

saga.init_lsp_saga {
  -- "single" "double" "round" "plus"
    border_style = "round",
    use_saga_diagnostic_sign = false,
    error_sign = 'x',
    warn_sign = '',
    hint_sign = 'H',
    infor_sign = 'I',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = false
    },
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    rename_prompt_prefix = '  ',
}

-- Key mappings
---------------
--[[ local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true} ]]
--[[ map('n', 'gh', ':Lspsaga lsp_finder<CR>', options)
map('n', 'gs', ':Lspsaga signature_help<CR>', options) ]]
-- map('n', 'gD', ':lua require"lspsaga.provider".preview_definition()<CR>', options)
--[[ map('n', '<C-u>', ':lua require"lspsaga.action".smart_scroll_with_saga(1)<CR>', options)
map('n', '<C-b>', ':lua require"lspsaga.action".smart_scroll_with_saga(-1)<CR>', options) ]]
--[[ map('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', options)
map('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', options) ]]
-- map('n', '<leader>lk', ':Lspsaga hover_doc<CR>', options)
-- map('n', '<leader>lr', ':Lspsaga rename<CR>', options)
-- map('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', options)

-- add your config value here
-- default value
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- 1: thin border | 2: rounded border | 3: thick border | 4: ascii border
-- border_style = 1
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}
