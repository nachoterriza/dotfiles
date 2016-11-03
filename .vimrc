execute pathogen#infect()
filetype plugin indent on
set nocompatible

se nu
syntax on
set nohlsearch
set incsearch
set smarttab
set wildmenu
set wildmode=list:longest,full
map <C-a> :NERDTreeTabsToggle<CR>
nnoremap J :tabprevious<CR>
nnoremap K :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
