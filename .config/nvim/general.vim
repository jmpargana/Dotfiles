"========================================================
"================      BASIC     ========================
"========================================================

set hidden
set path+=**
set nu rnu
set expandtab               " change indentation behaviour
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set showmatch               " show  parenthesis match
set nowrap                  " wrap text that exceeds screen width
set matchpairs+=<:>         " highlight pairs
set ignorecase              " ignore matching cases
set magic                   " for regex search
set nobackup                " disable backup, swap files, etc.
set nowritebackup
set tw=100
set splitbelow              " set terminal to open below
set updatetime=300
set shortmess+=c
set guicursor=a:blinkon0
set termguicolors


" Source vimrc after reediting
au! BufWritePost $HOME/.config/nvim/init.vim source %

" return to the last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" filetypes with 2 spaces tab indentation
autocmd Filetype {{java,type}script{,react},html,dart,xml,vue,json,yaml,yml} setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

let $RC="$HOME/.config/nvim/init.vim"
let $RTP="$HOME/.config/nvim"
