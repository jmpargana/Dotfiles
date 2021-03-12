local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('', '<space>c', '"+y')                      -- friendly copy
map('n', '<space><cr>', '<cmd>noh<cr>')         -- stop highlight
map('n', '<space>pu', '<cmd>PackerUpdate<cr>')  -- install all plugins
map('n', '<space>lf', '<cmd>luafile %<cr>')     -- source current lua file
map('n', '<space>tt', '<cmd>term<cr>')          -- launch terminal

-- Window navigation
map('', '<C-j>', '<C-W>j')
map('', '<C-k>', '<C-W>k')
map('', '<C-h>', '<C-W>h')
map('', '<C-l>', '<C-W>l')
map('', '<C-s>', '<C-W>s')

-- Save and exit
map('n', '<C-q>', '<cmd>q!<cr>')
map('n', '<C-x>', '<cmd>x<cr>')
map('n', '<space>w', '<cmd>w<cr>')
map('n', '<space>q', '<cmd>q!<cr>')
map('n', '<space>x', '<cmd>x<cr>')

-- Indent block
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Completion
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
