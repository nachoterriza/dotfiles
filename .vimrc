filetype plugin indent on
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }


call plug#end()

let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

"function! CleverTab()
"	if strpart( getline('.'), 0, col('.')-1) =~ '^\s*$'
"		return "\<Tab>"
"	else
"		return "\<C-N>"
"	endif
"endfunction
"
"inoremap <Tab> <C-R>=CleverTab()<CR>

se nu
syntax on
colorscheme dracula
set nohlsearch
set incsearch
set smartcase 
set wildmenu
set wildmode=list:longest,full

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

map <C-a> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.swp$', '\.git$']
nnoremap J :tabprevious<CR>
nnoremap K :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
