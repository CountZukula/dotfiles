set nocompatible              " be iMproved, required
filetype off                  " required

" show syntax highlighting
syntax on

" search highlighting
set incsearch

" some generic options... :help them if you want
" also check https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
set laststatus=2
set ruler
set wildmenu

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" This should set markdown syntax for all .md files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
