execute pathogen#infect()
filetype plugin indent on
set nocompatible

let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-N>"
	endif
endfunction

inoremap <Tab> <C-R>=CleverTab()<CR>

se nu
syntax on
colorscheme dracula
set nohlsearch
set incsearch
set smarttab
set wildmenu
set wildmode=list:longest,full
map <C-a> :NERDTreeTabsToggle<CR>
nnoremap J :tabprevious<CR>
nnoremap K :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
