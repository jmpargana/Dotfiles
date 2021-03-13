local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 2

opt('o', 'path', '.,**')
opt('b', 'expandtab', true)
opt('b', 'shiftwidth', indent)
opt('b', 'smartindent', true)
opt('b', 'tabstop', indent)
opt('o', 'hidden', true)
opt('o', 'ignorecase', true)
opt('o', 'splitbelow', true)
opt('o', 'wildmode', 'list:longest')
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'wrap', false)
opt('o', 'showmatch', true)
opt('o', 'magic', true)
opt('o', 'backup', false)
opt('o', 'writebackup', false)
opt('o', 'guicursor', 'a:blinkin0')
opt('o', 'termguicolors', true)
opt('o', 'completeopt', 'menuone,noinsert,noselect')

vim.cmd 'colorscheme tender'
