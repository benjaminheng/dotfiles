set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Add plugins below
if !has("gui_running")
    Plugin 'junegunn/fzf.vim'
endif
    
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'scrooloose/nerdcommenter'
Plugin 'cohama/lexima.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'SirVer/ultisnips'
Plugin 'shime/vim-livedown'
Plugin 'ajh17/VimCompletesMe'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'mhinz/vim-grepper'
call vundle#end()
filetype plugin indent on
filetype indent on

set guifont=Hack\ Regular:h11
set encoding=utf-8
set fileencoding=utf-8
set backupdir=/tmp
set directory=/tmp

" General options
"""""""""""""""""""""""""""""""""""""""""""""
colorscheme jellybeans
filetype on
syntax on
set guioptions-=T       " Remove toolbar
set guioptions-=m       " Remove menu
set guioptions-=L       " Remove left scroll-bar
set guioptions-=r       " Remove right scroll-bar
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set nobackup
set laststatus=2
set winaltkeys=no
set number 
set relativenumber
set ignorecase
set smartcase
set linebreak       " word wrap
set hlsearch
set scrolloff=1
set tw=0
set incsearch       " Search before pressing enter
set completeopt-=preview    " remove scratchpad preview from omnicomplete
set ttimeoutlen=10  " Keycode delay

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

" Persistent undo
set undodir=~/.vim/undodir
set undofile

" Variable definitions
"""""""""""""""""""""""""""""""""""""""""""""
let &showbreak = '--→ '
let mapleader = ","

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_regexp = 1
let g:ctrlp_prompt_mappings = { 'PrtAdd(".*")': ['<space>'] }
let g:ctrlp_extensions = ['tag']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
\   'dir': 'node_modules\|env'
\ }

" Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#whitespace#checks = ['indent']

" Plugin 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.vim/tags/'
let g:gutentags_exclude = ['node_modules', 'env']

" Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers =  ['flake8']
let g:syntastic_javascript_checkers = ['eslint']

" Plugin 'pangloss/vim-javascript'
let b:javascript_fold = 0

" Plugin 'cohama/lexima.vim'
let g:lexima_enable_basic_rules = 0

" Auto-commands
"""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd filetype javascript setlocal sw=2 sws=2 ts=2
autocmd FileType python setlocal omnifunc=python3complete#Complete

" Mappings
"""""""""""""""""""""""""""""""""""""""""""""
if !has('gui_running')
    " Plugin 'junegunn/fzf.vim'
    nnoremap <silent> <Leader><space> :Files<CR>
    nnoremap <silent> <Leader>t :Tags<CR>
endif

nmap <F8> :NERDTreeToggle<CR>
nmap <C-F9> :TagbarToggle<CR>
nmap <F9> :TagbarOpen fjc<CR>
nmap <Leader>f :CtrlP<Space>
nmap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>

" fix for properly indenting lines starting with # on a new line
inoremap # X#

" map jk to <Esc>
inoremap jk <Esc>

" switch tabs
nnoremap <silent> <C-w><C-l> :tabnext<CR>
nnoremap <silent> <C-w><C-h> :tabprevious<CR>

" switch splits
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-j> <c-w>j
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-l> <c-w>l

" yank/paste to/from clipboard
vmap <leader>y "*y
nmap <leader>p "*p

" clear search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" Close autocomplete popup with <C-Space>
inoremap <expr><C-Space> pumvisible() ? "\<C-y>" : "\<C-Space>"
