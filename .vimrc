"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" General Setup
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set expandtab               " change indentation behaviour
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

set path+=**
set encoding=utf-8          " always needed
set fileencoding=utf-8

set nu rnu                  " show hybrid line numbers
set showcmd                 " show last command
set nofoldenable            " disable folding in markdown files
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu

filetype indent on          " indent according to each filetype
set showmatch               " show  parenthesis match
set history=500             " how many lines of history VIM remembers
syntax on                   " syntax highlighting
filetype plugin indent on

" set nowrap                  " wrap text that exceeds screen width
set matchpairs+=<:>         " highlight pairs
set hlsearch                " highlight matching search patterns
set incsearch               " enable incremental search
set ignorecase              " ignore matching cases
set nocompatible            " open files with vim instead of vi

set so=5                    " set 5 lines to the cursor - useful in big screens
set ruler                   " always show current position
set cmdheight=1             " height of the command bar
set hid                     " a buffer becomes hidden when it is abandoned
set magic                   " for regex search
set updatetime=300          " for autocompletion

set nobackup                " disable backup, swap files, etc.
set nowritebackup
" set paste                   " when pasting from clipboard 
set nowb
set noswapfile
set lbr                     " break line on 100 characters
set tw=100

set guioptions-=r           " disable scrollbars
set guioptions-=R
set guioptions-=l
set guioptions-=L

set splitbelow              " set terminal to open below
set keywordprg=:Man
set completeopt-=preview    " prevent vim from opening buffer when plugin makes suggestions




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Mappings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","         " define the leader

" fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>x :x<cr>
nmap <leader>o :only<cr>


" open terminal
nnoremap <leader>c :term<cr>

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar>edit!


" map space to search
noremap <space> /

" disable highlight when ,RET is pressed
noremap <silent> <leader><cr> :noh<cr>


" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>




" easier window navigation (like i3)
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l


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

" filetypes with 2 spaces tab indentation
autocmd Filetype {{java,type}script{,react},html,dart} setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

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

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'




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
Plug 'junegunn/goyo.vim'


""""""""""""""""""""""""""""""""""""""""""""""
"""
""" PROGRAMMING LANGUAGES
"""
""""""""""""""""""""""""""""""""""""""""""""""

" Syntax Checker and Auto Completion
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Rust
Plug 'rust-lang/rust.vim'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" TypeScript for React
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'


" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


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
" set t_Co=265

" set termguicolors

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
colorscheme PaperColor


" Change Colorscheme
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>



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






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" MODES & PLUGIN SETUP
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ALEfix from ALE
let b:ale_fixers = {
    \   'javascript': ['prettier', 'eslint'],
    \   'python': ['yapf', 'black', 'autopep8']
    \}

let g:ale_python_auto_pipenv = 1
let g:ale_fix_on_save = 1


nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)



" CoC
if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" : 
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()


" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostics-prev)
nmap <silent> ]g <Plug>(coc-diagnostics-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>. <Plug>(coc-codeaction)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight references when holding cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formating selected code.
xmap <leader>p <Plug>(coc-format-selected)
nmap <leader>p <Plug>(coc-format-selected)



" Dart
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1

noremap <leader>df :DartFmt<cr>






""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""

" I use fzf to:
"   - search for files in git directory
"   - all directories recursively
"   - navigate through the open buffers
"   - open recently opened files
"   - create ctags for definition jumps
"   - change colorscheme
"   - search for pattern in directory (with ripgrep)

noremap <leader>f :GFiles <cr>
noremap <leader>F :Files <cr>
noremap <leader>o :Buffers<cr>   

command! CD cd %:p:h

autocmd FileType c      nnoremap <leader>ce :make %<<cr> :!./%<<cr>
autocmd FileType cpp    nnoremap <leader>ce :make %<<cr> :!./%<<cr>
autocmd FileType python nnoremap <leader>pi :!python -i %<cr>
autocmd FileType python nnoremap <leader>pr :!python %<cr>

" show files recently edited
command! FZFMru call fzf#run({
    \  'source':  v:oldfiles,
    \  'sink':    'e',
    \  'options': '-m -x +s',
    \  'down':    '40%'})

noremap <leader>u :FZFMru<CR>


" CTAGS Setup
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

noremap <leader>t :Tags<cr>


command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-ignore-vcs --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1, 
    \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%') 
    \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
    \   <bang>0)


noremap <C-g> :Rg <Cr>



""""""""""""""""""""""""""""""""""""""""""""""""
" PYTHON
""""""""""""""""""""""""""""""""""""""""""""""""

" This script should load three lines in ipython 
"
" import module_name
" import importlib
" re = lambda: importlib.reload(module_name)
"
" so the current module can easily be reloaded when changes are made
function! s:load_module_ipython()
    let l:file = expand('%:r')
    term ipython
endfunction

autocmd FileType python nmap <leader>t :<C-u>call <SID>load_module_ipython()<CR>


" Python PIPENV support
let pipenv_venv_path = system('pipenv --venv')

if shell_error == 0
    let venv_path = substitute(pipenv_venv_path, '\n', '', '')
    let g:ycm_python_binary_path = venv_path . '/bin/python'
else
    let g_ycm_python_binary_path = 'python'
endif

let g:ale_python_auto_pipenv = 1
let python_highlight_all = 1
let g:ale_fix_on_save = 1




""""""""""""""""""""""""""""""""""""""""""
" GO
""""""""""""""""""""""""""""""""""""""""""
"
" Navigation is covered by (ctrl-]/gd) to go to definition
" and (ctrl-t) to pop to first goto jump call
"
" To check for documentation, either wait for a couple of seconds
" or type (K) to split a mini-buffer with the documentation


" run :GoBuild or :GoTestCompile according to test or regular file type
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction


" basic keybindings
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)

" toggle :GoCoverage to highlight the code covered by your tests
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
" autocmd FileType go nmap <leader>cb <Plug>(go-coverage-browser)
autocmd FileType go nmap <leader>a :GoAlternate<cr>

autocmd FileType go nmap <leader>d :GoDecls<cr>
autocmd FileType go nmap <leader>dd :GoDeclsDir<cr>


" this will import missing libs automatically on save
let g:go_fmt_command = "goimports"


" beautify all the code
let g:go_highlight_types=1
" let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types=1
let g:go_highlight_build_contraints=1


" Create shortcuts to open alternate (test file) in different tab
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Functions
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



function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
