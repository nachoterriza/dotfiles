filetype plugin indent on
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'dag/vim-fish'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }


call plug#end()

"
" Airline options
"

let g:airline_theme = 'cobalt2'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"
" YouCompleteMe options
"

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

"
" Eclim options
"

let g:EclimCompletionMethod = 'omnifunc'


"function! CleverTab()
"	if strpart( getline('.'), 0, col('.')-1) =~ '^\s*$'
"		return "\<Tab>"
"	else
"		return "\<C-N>"
"	endif
"endfunction
"
"inoremap <C-Tab> <C-R>=CleverTab()<CR>

se nu
syntax on
colorscheme solarized
set background=dark
set nohlsearch
set incsearch
set smartcase 
set wildmenu
set wildmode=list:longest,full
set modelines=0
set encoding=utf-8
set scrolloff=3
set hidden
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
