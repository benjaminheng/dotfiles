call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'benjaminheng/vim-smyteql-syntax'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'cohama/lexima.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'w0rp/ale'
Plug 'terryma/vim-expand-region'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
filetype plugin indent on
filetype indent on

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
set linebreak               " word wrap
set hlsearch
set scrolloff=1
set tw=0
set incsearch               " Search before pressing enter
set completeopt-=preview    " remove scratchpad preview from omnicomplete
set ttimeoutlen=10          " Keycode delay
set formatoptions+=j        " Delete comment character when joining commented lines
set cursorline
" set lazyredraw
set ttyfast

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
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips/"

" Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#whitespace#checks = ['indent']

" Plugin 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.config/nvim/tags/'
let g:gutentags_ctags_exclude = ['node_modules', 'env', 'env2', 'vendor']
let g:gutentags_file_list_command = { 'markers': { '.git': 'git ls-files | grep -v "^vendor/"' } }

" Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '● '
let g:ale_sign_warning = '● '
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'go vet'],
\}
hi ALEErrorSign ctermfg=red ctermbg=236
hi ALEWarningSign ctermfg=yellow ctermbg=236
hi ALEErrorSign ctermbg=236
hi ALEError cterm=underline ctermbg=none
hi ALEWarning cterm=underline ctermbg=none

" Neovim-related options
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'

" Plugin 'pangloss/vim-javascript'
let b:javascript_fold = 0

" Plugin 'cohama/lexima.vim'
let g:lexima_enable_basic_rules = 0

" Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Plug 'terryma/vim-expand-region'
" Use v and C-v to increase and decrease region expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Plug 'vimwiki/vimwiki'
let wiki = {}
let wiki.path = '~/Dropbox/Miscellaneous/vimwiki/'
let wiki.syntax = 'markdown'
let wiki.nested_syntaxes = {'python': 'python', 'js': 'javascript', 'sql': 'sql'}
let g:vimwiki_list = [wiki]
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1

" Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_disable_when_zoomed = 1

" Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gi  <Plug>(go-info)
autocmd FileType go setlocal noexpandtab sw=8 ts=8

" Plug 'machakann/vim-sandwich'
call operator#sandwich#set('delete', 'all', 'highlight', 0)
call operator#sandwich#set('add', 'all', 'highlight', 2)
call operator#sandwich#set('replace', 'all', 'highlight', 2)
nmap s <NOP>
xmap s <NOP>

" Functions
"""""""""""""""""""""""""""""""""""""""""""""
function! Prettier()
    " store cursor position
    let l:curPos = getpos('.')
    silent %!prettier --stdin --trailing-comma='all' --single-quote=false --parser='babylon'
    " restore cursor position
    call cursor(l:curPos[1], l:curPos[2])
endfunction

" Auto-commands
"""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd FileType javascript,sqrl,yaml,htmldjango setlocal sw=2 ts=2
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType sqrl setlocal commentstring=#\ %s
autocmd FileType javascript nnoremap <silent> <leader>gf :call Prettier()<CR>

" Mappings
"""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'junegunn/fzf.vim'
nnoremap <silent> <Leader>t :Tags<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>a :Ag<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

nnoremap <Leader>mt :NERDTreeToggle<CR>

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
