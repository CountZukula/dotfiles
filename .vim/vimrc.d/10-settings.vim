set nocompatible " be iMproved, required
filetype off     " required

" some generic options... :help them if you want
" also check https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
set laststatus=2
set ruler
set wildmenu
set encoding=UTF-8 " necessary for vim-devicons
set showmatch " set parens to match each other
set incsearch " search as characters are entered
set hlsearch " highlight matches

" some auto indentation 
syntax enable
set smartindent
set tabstop=8
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=0

" numbering options
set number
set relativenumber

" show syntax highlighting (this might be superfluous with the above...)
" syntax on
