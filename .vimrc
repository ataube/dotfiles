call pathogen#infect()
syntax on
filetype plugin indent on

:colorscheme molokai
let g:molokai_original = 1
set guifont=Menlo\ Regular:h14"
set number
set hlsearch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
map <F2> :NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
au BufRead,BufNewFile *.hamlc set ft=haml
