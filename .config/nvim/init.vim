" filetype off
" set rtp+=~/.config/nvim/bundle/Vundle.vim
" Add plugins below
call plug#begin('~/.config/nvim/plugged')
" call vundle#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'benjaminheng/vim-smyteql-syntax'
Plug 'neomake/neomake'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'cohama/lexima.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript', { 'commit': 'd7f4728' }
Plug 'SirVer/ultisnips'
Plug 'shime/vim-livedown'
Plug 'hynek/vim-python-pep8-indent'
" Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-expand-region'
call plug#end()
" call vundle#end()
filetype plugin indent on
filetype indent on

if has('nvim')
    " Hack to get C-h working in NeoVim
    nmap <BS> <C-W>h
    nmap <C-W><BS> :tabprevious<CR>
endif

" set encoding=utf-8
" set fileencoding=utf-8
set backupdir=/tmp
set directory=/tmp

" General options
"""""""""""""""""""""""""""""""""""""""""""""
colorscheme jellybeans
filetype on
syntax on
set mouse=a
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
set formatoptions+=j " Delete comment character when joining commented lines
set cursorline
" set lazyredraw      " Performance
set ttyfast         " Performance in terminals

" Persistent undo
set undodir=~/.config/nvim/undodir
set undofile

" Variable definitions
"""""""""""""""""""""""""""""""""""""""""""""
let &showbreak = '--→ '
let mapleader = ","

" Plug 'junegunn/fzf.vim'
" respect .gitignore, among others
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#branch#enabled = 0 " disable branch in statusline
let g:airline#extensions#whitespace#checks = ['indent']

" Plugin 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.config/nvim/tags/'
let g:gutentags_exclude = ['node_modules', 'env']

" Plug 'neomake/neomake'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_place_signs = 1
let g:neomake_error_sign = {'text': '● ', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '● ', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': 'M ', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'I ', 'texthl': 'NeomakeInfoSign'}
hi NeomakeErrorSign ctermfg=red ctermbg=236
hi NeomakeWarningSign ctermfg=yellow ctermbg=236
hi NeomakeMessageSign ctermfg=white ctermbg=NONE
hi NeomakeInfoSign ctermfg=white ctermbg=NONE
autocmd! BufWritePost * Neomake

" Neovim-related options
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'

" Plugin 'pangloss/vim-javascript'
let b:javascript_fold = 0

" Plugin 'cohama/lexima.vim'
let g:lexima_enable_basic_rules = 0

" Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
let g:ackhighlight = 1

" Plugin 'mhinz/vim-startify'
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_list_order = [
\   ['   Sessions'],
\   'sessions',
\   ['   Bookmarks'],
\   'bookmarks',
\   ['   MRUs'],
\   'files',
\   ['   Commands'],
\   'commands'
\ ]
let g:startify_bookmarks = [
\   {'t': '~/todo.md'},
\   {'b0': '~/.config/nvim/init.vim'},
\   {'b1': '~/dev/l-client'},
\   {'b2': '~/dev/l-backend'},
\   {'b3': '~/dev/Flaggings'},
\   {'b4': '~/dev/Snitch'},
\   {'b5': '~/dev/Carousell-Django-2'},
\ ]

" Plug 'terryma/vim-expand-region'
" Use v and C-v to increase and decrease region expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Auto-commands
"""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
" autocmd filetype javascript setlocal sw=2 sws=2 ts=2
autocmd filetype javascript setlocal sw=2 ts=2
autocmd filetype yaml setlocal sw=2 ts=2
autocmd FileType python setlocal omnifunc=python3complete#Complete

" Mappings
"""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'junegunn/fzf.vim'
" nnoremap <silent> <Leader><space> :Files<CR>
nnoremap <silent> <Leader>t :Tags<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>a :Ag<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

nmap <F8> :NERDTreeToggle<CR>
nmap <C-F9> :TagbarToggle<CR>
nmap <F9> :TagbarOpen fjc<CR>
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
vmap <leader>y "+y
nmap <leader>p "+p

" clear search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" Close autocomplete popup with <C-Space>
inoremap <expr><C-Space> pumvisible() ? "\<C-y>" : "\<C-Space>"
