filetype plugin indent on
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'dag/vim-fish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bfredl/nvim-ipy'

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

let g:powerline_pycmd = 'py3'

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
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_collect_identifiers_from_tags_files = 1

nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

"
" Eclim options
"

let g:EclimCompletionMethod = 'omnifunc'

"
" FZF functions
"
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({'source': <sid>buffer_lines(), 'sink': function('<sid>line_handler'), 'options': '--extended --nth=3..', 'down': '60%'})

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

"function! CleverTab()
"	if strpart( getline('.'), 0, col('.')-1) =~ '^\s*$'
"		return "\<Tab>"
"	else
"		return "\<C-N>"
"	endif
"endfunction
"
"inoremap <C-Tab> <C-R>=CleverTab()<CR>

set number
syntax on
let mapleader = "ñ"
colorscheme solarized
set background=dark
set nohlsearch
set incsearch
set ignorecase
set smartcase 
set wildmenu
set wildmode=list:longest,full
set modelines=0
set encoding=utf-8
set scrolloff=9
set hidden
set noexpandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set splitright

" tell vim to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/home/nacho/.vimundo

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.class,*.o
set title

nnoremap <C-e> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.swp$', '\.git$']

" tab management
"nnoremap J :tabprevious<CR>
"nnoremap K :tabnext<CR>
"nnoremap <C-t> :tabnew<CR>

"buffer management
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>e :enew<CR>
nnoremap <leader>o :only<CR>

nnoremap <leader>f :call fzf#run({'sink': 'e', 'left': '30%'})<CR>
nnoremap <leader>b :call fzf#run({'source': map(range(1, bufnr('$')), 'bufname(v:val)'), 'sink': 'e', 'left': '30%'})<CR>

nnoremap <leader>t <C-]>

nnoremap <leader><leader> <C-w><C-w>

autocmd Filetype c nnoremap <buffer> <F5> :w<CR> :!clear; make<CR> :!./%<<CR>
autocmd Filetype python nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
autocmd Filetype java nnoremap <buffer> <F5>:update<Bar>execute '!javac '.shellescape(@%, 1)<CR>
