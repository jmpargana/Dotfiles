"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
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

" always needed
set encoding=utf-8
set fileencoding=utf-8

" show hybrid line numbers
set nu rnu

" show last command
set showcmd

" disable folding in markdown files
set nofoldenable

" highlight current line
set cursorline

" visual autocomplete for command menu
set wildmenu

" indent according to each filetype
filetype indent on

" show  parenthesis match
set showmatch

" how many lines of history VIM remembers
set history=500


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
set tags=tags



" VIM user interface
" set 7 lines to the cursor - when moving vertically
set so=7

" always show current position
set ruler

" height of the command bar
set cmdheight=1

" a buffer becomes hidden when it is abandoned
set hid

" for regex search
set magic

" disable backup, swap files, etc.
set nobackup
set nowb
set noswapfile

" break line on 100 characters
set lbr
set tw=100

" disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L


" set terminal to open below
set splitbelow
" set tws=10x0

set keywordprg=:Man






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Mappings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" define the leader
let mapleader = ","

" fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>x :x<cr>
nmap <leader>o :only<cr>


" open terminal
nnoremap <leader>c :term<cr>


" :W sudo saves the file
" (useful for handling the permission-denied errror)
command! W execute 'w !sudo tee % > /dev/null' <bar>edit!


" map space to search
noremap <space> /

" disable highlight when ,RET is pressed
noremap <silent> <leader><cr> :noh<cr>


" split window and open edit command 
noremap <leader>v :vsp<cr><C-w>l:e 
noremap <leader>s :sp<cr><C-w>j:e 


" easier window navigation (like i3)
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l


" close current buffer
noremap <leader>bc :Bclose<cr>:tabclose<cr>gT

" kill all windows
noremap <leader>bo :only<cr>

" close all buffers
noremap <leader>ba :bufdo :Bclose<cr>:tabclose<cr>gT

" navigate between buffers
noremap <leader>l :bnext<cr>
noremap <leader>h :bprevious<cr>

" tab mappings
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove<cr>
noremap <leader>t<leader> :tabnext

noremap <leader>tl :tabr<cr>
noremap <leader>th :tabl<cr>

" open new tab with the current buffer's path
noremap <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/


" return to the last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" parenthesis, brackets, quotes
" this is not needed since vim surrounding provides the same
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>


autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype dart setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2


" type ,pu to install all plugins
noremap <leader>pu :PlugInstall<cr>





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Setup Plugger and Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Automatically install Vim-Plug with all Plugins when first launched
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" configurations are in EDITING and PROGRAMMING sections
call plug#begin('~/.vim/plugged')


""""""""""""""""""""""""""""""""""""""""""""""
"""
""" EDITING TOOLS
"""
""""""""""""""""""""""""""""""""""""""""""""""

Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
" Plug 'godlygeek/tabular'              " haven't used it so far
" Plug 'terryma/vim-multiple-cursors'   " regex is just as effective
" Plug 'scrooloose/nerdtree'            " fzf is much better
" Plug 'frazrepo/vim-rainbow'           " breaks with c++ and c
" Plug 'junegunn/goyo.vim'              " gives a cleaner look
" Plug 'tpope/vim-fugitive'             " like magit (terminal is right here)



""""""""""""""""""""""""""""""""""""""""""""""
"""
""" THEMES
"""
""""""""""""""""""""""""""""""""""""""""""""""

Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'kaicataldo/material.vim'


""""""""""""""""""""""""""""""""""""""""""""""
"""
""" PROGRAMMING LANGUAGES
"""
""""""""""""""""""""""""""""""""""""""""""""""

" Syntax Checker and Auto Completion
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }

" Rust
Plug 'rust-lang/rust.vim'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" JavaScript for React
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'kh3phr3n/python-syntax'           


call plug#end()







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Theme Config
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" termguicolors don't work in tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"""""""""""""""""""
"" THEME VARS
"""""""""""""""""""

" This needs some tweaking in your terminal theme as well
" - dark
" - light
set background=light

set termguicolors

" let ayucolor="light"        " some themes need to define variables before
" let g:solarized_termcolors=256


let g:material_terminal_italics = 1     " only for material

" Material Themes
" - lighter
" - palenight
" - ocean 
" - darker
let g:material_theme_style = 'lighter'


" Light
" - PaperColor  
" - auy
" - solarized
"
" Dark
" - nord
" - material
colorscheme material



"""""""""""""""""""
"" TAB LINE
"""""""""""""""""""

" Either Airline or Lightline is needed
" I have both, since powerline fonts don't work 
" on one of my computers
" Some themes take care of these variables for you

" let g:lightline = { 'colorscheme': 'PaperColor' }
" let g:airline_theme='papercolor'


" air-line
let g:airline_powerline_fonts = 1
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''"





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" MODES & PLUGIN SETUP
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ALEfix from ALE
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}


" NERDTree
noremap <leader>nn :NERDTreeToggle<CR>


" Rainbow Parenthesis Improved
" let g:rainbow_active=1


" prettier
noremap <leader>p :Prettier<cr> 

let g:vim_jsx_pretty_colorful_config = 1


" Dart
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1


" use the_silver_searcher if possible
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif



" ACK 
" open ack and put the cursor in the right position
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
noremap <leader>g :Ack

" search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>


" MRU PLUGIN
" show files recently edited
let MRU_Max_Entries = 300
noremap <leader>u :MRU<CR>


" Python PIPENV support
let pipenv_venv_path = system('pipenv --venv')

if shell_error == 0
    let venv_path = substitute(pipenv_venv_path, '\n', '', '')
    let g:ycm_python_binary_path = venv_path . '/bin/python'
else
    let g_ycm_python_binary_path = 'python'
endif

let g:ale_python_auto_pipenv = 1



" " vim room (its really cool!)
" let g:goyo_width=100
" let g:goyo_margin_top = 2
" let g:goyo_margin_bottom = 2
" nnoremap <silent> <leader>z :Goyo<cr>


" bufExplorer plugin
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


" FZF
noremap <leader>f :GFiles <cr>
noremap <leader>F :Files <cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Functions from amix vimrc 
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction


function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction



function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
