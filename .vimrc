" load all files in the vimrc.d directory
set runtimepath+=~/.vim
execute 'runtime!' 'vimrc.d/*'

" Overwrite the clipboard command to use xclip
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'

" This should set markdown syntax for all .md files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
highlight Comment cterm=italic

" EASYALIGN settings - plugin by junegunn (vipga= aligns text around = chars)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" NERDTREE settings - he way to open the nerdtree
map <C-n> :NERDTreeToggle<CR>

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
