filetype plugin indent on
set nocompatible

call plug#begin('~/.vim/plugged')

"Plug 'dracula/vim'
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
let g:EclimCompletionMethod = 'omnifunc'

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
"colorscheme dracula
colorscheme lucario
set nohlsearch
set incsearch
set smartcase 
set wildmenu
set wildmode=list:longest,full
set modelines=0
set encoding=utf-8
set scrolloff=3
set hidden
"set relativenumber

"set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

" tell vim to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/home/nacho/.vimundo

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.class,*.o
set title

map <C-e> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.swp$', '\.git$']
nnoremap J :tabprevious<CR>
nnoremap K :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

autocmd Filetype c nnoremap <buffer> <F5>:w<CR> :!clear; make<CR> :!./%<<CR>
autocmd Filetype python nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
autocmd Filetype java nnoremap <buffer> <F5>:update<Bar>execute '!javac '.shellescape(@%, 1)<CR>
