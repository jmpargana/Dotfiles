local cmd = vim.cmd

cmd 'set shortmess+=c'

vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_enable_auto_popup = false

-- Use autocompletion in every buffer by default
cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]

-- cmd [[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]]
-- cmd [[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]

