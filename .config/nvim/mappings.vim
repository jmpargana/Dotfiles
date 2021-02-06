"========================================================
"==============      MAPPINGS     =======================
"========================================================

let g:mapleader = "\<Space>"

" easier window navigation (like i3)
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
noremap <leader>j <C-W>j
noremap <leader>k <C-W>k
noremap <leader>h <C-W>h
noremap <leader>l <C-W>l

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar>edit!

" disable highlight when ,RET is pressed
noremap <silent> <leader><cr> :noh<cr>

" Alternate way to save, exit and both
nnoremap <C-s> :w<cr>
nnoremap <C-q> :q!<cr>
nnoremap <C-x> :x<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>x :x<cr>

" Indent continuously
vnoremap < <gv
vnoremap > >gv

" type ,pu to install all plugins
noremap <leader>pu :PlugInstall<cr>

command! CD cd %:p:h
