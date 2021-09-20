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
        virtual_text = true
    },
    max_preview_lines = 30, -- preview lines of lsp_finder and definition preview
    rename_prompt_prefix = '  ',
}
