"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setup
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" change indentation behaviour
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

" show line number
set number

" show last command
set showcmd

" highlight current line
set cursorline

" visual autocomplete for command menu
set wildmenu

" indent according to each filetype
filetype indent on

" show  parenthesis match
set showmatch


" syntax highlighting
syntax on
filetype plugin indent on

" wrap text that exceeds screen width
set wrap

"highlight pairs
set matchpairs+=<:>

" highlight matching search patterns
set hlsearch

" enable incremental search
set incsearch

" ignore matching cases
set ignorecase

" open files with vim instead of vi
set nocompatible

" for file navigation
set path+=**

" commands for file jump






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Plugger and Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" configurations are in EDITING and PROGRAMMING sections
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/frazrepo/vim-rainbow'


call plug#end()






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme Config
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

colorscheme PaperColor




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EDITING
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" multiple cursors
" https://github.com/terryma/vim-multiple-cursors


" vim-surround
" surround selected text with any given char
" https://github.com/tpope/vim-surround
" REALLY POWERFULL!!


" NERDTree
map <C-o> :NERDTreeToggle<CR>


" Emmet
" <C-y>,


" Rainbow Parenthesis Improved
let g:rainbow_active=1


" autopais
" https://github.com/jiangmiao/auto-pairs




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Since all guides advise you not to install plugins
" when you start using vim the following ones will
" only be installed in the future


" Autogroups https://dougblack.io/words/a-good-vimrc.html
" learn how to define custom values for each language mode

" Command-T https://github.com/wincent/Command-T
" open files and buffers and jump between tags

" ctrl.vim https://github.com/kien/ctrlp.vim
" fuzzy file, buffer, mru, tag finder

" repeat.vim https://github.com/tpope/vim-repeat
" I'm not sure what this one does

" NERDCommenter https://github.com/scrooloose/nerdcommenter
" comment script for vim

" ALE https://github.com/dense-analysis/ale
" Syntax checker server

" commentary.vim https://github.com/tpope/vim-commentary



" Other links
" VIM AWESOME - https://linuxhint.com/vim_awesome/
" awesome vim (github) - https://github.com/akrawchyk/awesome-vim
" ultimate vim config - https://github.com/amix/vimrc
