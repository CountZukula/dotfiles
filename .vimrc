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


" vim-plug - download if not there yet
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


call plug#end()



set guifont=FuraCode\ Nerd\ Font\ 11

" overwrite the clipboard command to use xclip
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'

" set up the color scheme
colorscheme gruvbox  " cool color scheme
:let g:airline_theme='gruvbox'
:set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_termcolors = 256

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


" This should set markdown syntax for all .md files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
highlight Comment cterm=italic

" EASYALIGN - plugin by junegunn (vipga= aligns text around = chars)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" the way to open the nerdtree
map <C-n> :NERDTreeToggle<CR>

" AIRLINE settings
" symbols section for unicode/airline symbols
" air-line (status line below, using fancy symbols)
let g:airline_powerline_fonts = 1
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
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" SYNTASTIC settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" MARKDOWN PREVIEW settings
" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'qutebrowser'
