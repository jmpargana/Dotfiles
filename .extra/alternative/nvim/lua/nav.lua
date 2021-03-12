-- FIXME: export this function to utils
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Global config
require('telescope').setup{
  defaults = {
    file_previwer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  }
}


map('n', '<space>ft', "<cmd>Telescope<cr>") -- List pickers
map('n', '<space>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>") -- All files
map('n', '<space>fp', "<cmd>lua require('telescope.builtin').git_files()<cr>")  -- Project files
map('n', '<space>o', "<cmd>lua require('telescope.builtin').buffers()<cr>") -- Opened buffers
map('n', '<space>u', "<cmd>lua require('telescope.builtin').oldfiles()<cr>") -- Last edited files (old | MRU)
map('n', '<space>fc', "<cmd>lua require('telescope.builtin').command_history()<cr>") -- Command history
-- Treesitter symbols
map('n', '<space>ft', "<cmd>lua require('telescope.builtin').treesitter()<cr>")
-- LSP References
map('n', '<space>fr', "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
-- LSP Workspace symbols
map('n', '<space>fs', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>")
-- Tags
map('n', '<space>fh', "<cmd>lua require('telescope.builtin').man_pages()<cr>")
