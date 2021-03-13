"========================================================
"==============      MAPPINGS     =======================
"========================================================

let g:mapleader = "\<Space>"

" easier window navigation (like i3)
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
noremap <C-s> <C-W>s
noremap <C-v> <C-W>v

" resize according to direction and not pixels
let g:vim_resize_disable_auto_mappings = 1
let g:resize_count = 8

nnoremap <silent> <C-M-h> :CmdResizeLeft<cr>
nnoremap <silent> <C-M-j> :CmdResizeDown<cr>
nnoremap <silent> <C-M-k> :CmdResizeUp<cr>
nnoremap <silent> <C-M-l> :CmdResizeRight<cr>


" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar>edit!

" disable highlight when ,RET is pressed
noremap <silent> <leader><cr> :noh<cr>

" Launch terminal
noremap <space>tt :term<cr>i

" Alternate way to save, exit and both
nnoremap <C-q> :qa!<cr>
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
command! LCD lcd %:p:h

" Edit file (create) when calling gn
nnoremap gn :e <cfile><cr>
