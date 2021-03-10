"========================================================
"================     PLUGINS     =======================
"========================================================


" Automatically install Vim-Plug with all Plugins when first launched
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

Plug 'kaicataldo/material.vim', { 'branch': 'main' }            " Themes 
Plug 'vim-airline/vim-airline'                                  " Status line 
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'                                     " Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'breuckelen/vim-resize'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " Navigation
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }   " Syntax and more
Plug 'neoclide/coc.nvim', { 'branch': 'release' }               " IDE 
Plug 'antoinemadec/coc-fzf'
Plug 'ludovicchabant/vim-gutentags'                           
Plug 'mattn/emmet-vim'

call plug#end()

