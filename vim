" Force utf-8
scriptencoding utf-8
set encoding=utf-8

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-grepper'
Plug 'kien/ctrlp.vim'
Plug 'valloric/youcompleteme'
#Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'

" vebugger
Plug 'shougo/vimproc.vim'
Plug 'idanarye/vim-vebugger'
call plug#end()

let mapleader = " "

" Syntax highlighting; don't clobber existing highlighting
if !exists("g:syntax_on")
    syntax enable
endif

" Recursively look for files using 'find'
set path+=**

" Color scheme
set background=dark
silent! colo desert
silent! colo solarized

" Tab width; backspace properly removes a tab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Tab key inserts spaces
set expandtab

set smarttab
set autoindent
set smartindent

" Don't write backup files
set nobackup
set nowritebackup
set noswapfile

" Make backspace behave normally
set backspace=indent,eol,start

" Horizontal movement wraps when at the start or end of a line
set whichwrap+=<,>,h,l
set wrap

" Disable annoying hard wrapping
set textwidth=0

" Make it obvious where 80 characters is
set colorcolumn=80

" Show line numbers
set number

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Key sequence timeouts
set timeoutlen=500
set ttimeoutlen=0

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Tab navigation
nnoremap th :tabfirst<cr>
nnoremap tj :tabnext<cr>
nnoremap tk :tabprev<cr>
nnoremap tl :tablast<cr>
nnoremap td :tabclose<cr>
nnoremap tn :tabnew<cr>
nnoremap tt :tabedit<space>
nnoremap tf :tabfind<space>

" Multi-file search; Don't jump to first result
nnoremap \ :Grepper -tool ack<cr>

" Add "open in tab" functionality to quickfix list in Grepper
" Alternatively use the 'romainl/vim-qf' plugin
autocmd FileType qf nnoremap <buffer> <silent> t <c-w><cr><c-w>T

" Highlight search results
set hlsearch

" Search as characters are entered
set incsearch

" Ignore case when searching
set ignorecase

" Set to auto read when a file is changed from the outside
set autoread

" Visual autocomplete for command menu
set wildmenu

" Lines from screen edge when vertical scrolling starts
set so=5

" Disable error sounds
set noeb vb t_vb=

" NERDTree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<cr>

" ALE
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['python'] = ['yapf']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" YCM
nnoremap <leader>g :YcmCompleter GoTo<cr>
set completeopt-=preview  " Disable preview window
let g:ycm_add_preview_to_completeopt = 0

" Language specific settings
autocmd FileType yaml setlocal ts=2 sw=2 sts=2
autocmd FileType vim setlocal tw=0

" Go settings
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0

" Enabling these settings cause rendering artifacts to appear
let g:go_auto_type_info = 0
let g:go_updatetime = 200
let g:go_fold_enable = []

" Always use semantic engine rather than basic identifier engine
let g:ycm_semantic_triggers = {
    \'go': ['re!^\s*\S\S']
\}
autocmd filetype go let b:ycm_min_num_of_chars_for_completion = 999

autocmd filetype go let b:ale_enabled = 0
autocmd filetype go setlocal noexpandtab nolist
autocmd filetype go nnoremap <buffer> <leader>g :GoDef<cr>
autocmd filetype go nnoremap <buffer> <leader>b :GoDefPop<cr>
autocmd filetype go nnoremap <buffer> <leader>t :GoInfo<cr>
autocmd filetype go nnoremap <buffer> <leader>i :GoInstall<cr>
autocmd filetype go nnoremap <buffer> <leader>r :GoRun<cr>
autocmd filetype go nnoremap <buffer> <leader>l :GoMetaLinter<cr>
autocmd filetype go nnoremap <buffer> <leader>c :GoCallers<cr>
autocmd filetype go nnoremap <buffer> <leader>m :GoRename<space>

" fzf
set rtp+=~/.fzf
nnoremap <leader>f :FZF<cr>
