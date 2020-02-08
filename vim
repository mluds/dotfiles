" Force utf-8
scriptencoding utf-8
set encoding=utf-8

" settings for scp editing with pi_netrw
set nocp
filetype plugin on

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'       " file navigation bar
Plug 'mhinz/vim-grepper'         " find-in-files; used with ack
Plug 'w0rp/ale'                  " linting engine
Plug 'tpope/vim-surround'        " modify 'surrounding'; good for html
Plug 'fatih/vim-go'              " IDE functionality for go
Plug 'jonathanfilip/vim-lucius'  " light/dark color scheme
Plug 'posva/vim-vue'             " vue syntax highlighting
Plug 'lervag/vimtex'             " latex tools

" vebugger - interactive debugging from vim
Plug 'shougo/vimproc.vim'
Plug 'idanarye/vim-vebugger'

call plug#end()

let mapleader = " "

" common sequences
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>a :qa<cr>
nnoremap <leader>t :terminal bash<cr>

" system clipboard integration
" i.e. use '+' register by default
nnoremap y "+y
vnoremap y "+y
nnoremap d "+d
vnoremap d "+d

nnoremap p "+p
nnoremap P "+P

" syntax highlighting; don't clobber existing highlighting
if !exists("g:syntax_on")
    syntax enable
endif

" recursively look for files using 'find'
set path+=**

" fzf - fuzzy file finder
set rtp+=~/.fzf
nnoremap <leader>f :FZF<cr>

" color scheme
silent! colo desert
silent! colo lucius

set background=light
if exists(':LuciusWhite')
    LuciusWhite
endif

" tab width; backspace properly removes a tab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set autoindent
set smartindent

" don't write backup files
set nobackup
set nowritebackup
set noswapfile

" make backspace behave normally
set backspace=indent,eol,start

" horizontal movement wraps when at the start or end of a line
set whichwrap+=<,>,h,l
set wrap

" disable annoying hard wrapping
set textwidth=0

" make it obvious where 80 characters is
set colorcolumn=80

" show line numbers
set number

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" key sequence timeouts
set timeoutlen=500
set ttimeoutlen=0

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" disable all bell sounds
" for WSL shells, you also need to put 'set bell-style none' in /etc/inputrc
set belloff=all
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb= belloff=all

" quicker window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" tab navigation
nnoremap th :tabfirst<cr>
nnoremap tj :tabnext<cr>
nnoremap tk :tabprev<cr>
nnoremap tl :tablast<cr>
nnoremap td :tabclose<cr>
nnoremap tn :tabnew<cr>
nnoremap tt :tabedit<space>
nnoremap tf :tabfind<space>

" multi-file search; don't jump to first result
nnoremap \ :Grepper -tool ack<cr>

" use escape to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" add "open in tab" functionality to quickfix list in grepper
" alternatively use the 'romainl/vim-qf' plugin
autocmd FileType qf nnoremap <buffer> <silent> t <c-w><cr><c-w>T

set hlsearch       " highlight search results
set incsearch      " search as characters are entered
set ignorecase     " ignore case when searching
set autoread       " set to auto read when a file is changed from the outside
set wildmenu       " visual autocomplete for command menu
set so=5           " lines from screen edge when vertical scrolling starts
set noeb vb t_vb=  " disable error sounds

" fixes indentation issue when pasting from external clipboards
" commented out for now,
" since checkhealth recommends not setting it permanently
" set paste

" nerdtree
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
let g:NERDTreeShowHidden = 1
" fixes bug where first letter gets cut off
let g:NERDTreeNodeDelimiter = "\t"
map <C-n> :NERDTreeToggle<cr>

" ale
let g:ale_fix_on_save = 0
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fixers = {}
autocmd filetype javascript let b:ale_fixers = ['prettier']
autocmd filetype python let b:ale_fixers = ['yapf']
autocmd filetype python let b:ale_linters = ['flake8']

" ycm
nnoremap <leader>g :YcmCompleter GoTo<cr>
set completeopt-=preview  " Disable preview window
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers = {
    \'go': ['re!^\s*\S\S']
\}

" language specific settings
autocmd FileType yaml setlocal ts=2 sw=2 sts=2
autocmd FileType vim setlocal tw=0

" go settings
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0

" enabling these settings cause rendering artifacts to appear
let g:go_auto_type_info = 0
let g:go_updatetime = 200
let g:go_fold_enable = []

" always use semantic engine rather than basic identifier engine
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

" tab key inserts spaces
" this is at the end to overwrite any hidden settings that affect it
set expandtab
