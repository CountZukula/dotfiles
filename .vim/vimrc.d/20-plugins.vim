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
" vim-plug - download if not there yet
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" manage vim-plug
call plug#begin('~/.vim/plugged')
"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
" if you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" have nodejs and yarn
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Pimp VIM with the gruvbox theme.
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Syntax checking for various formats
Plug 'scrooloose/syntastic'
" This adds kotlin syntax
Plug 'udalov/kotlin-vim'
" adds the 'c' command to do things with brackets,quotes, ... try `cs"'` on
" "blabla"
Plug 'tpope/vim-surround'
" adds fuzzy file finder to vim (do <c-p>)
Plug 'kien/ctrlp.vim'
" always load this last. supposed to make vim work with nerdfonts
Plug 'ryanoasis/vim-devicons'
" enable typescript 
Plug 'leafgarland/typescript-vim'
" add auto completion for various languages
" Plug 'Valloric/YouCompleteMe'
" enable copy to clipboard ('cpiw', 'cP', ...)
Plug 'christoomey/vim-system-copy'
" the left-most tree structure
Plug 'scrooloose/nerdtree'
" fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ripgrep integration
Plug 'jremmen/vim-ripgrep'
" intellisense like plugin!
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

