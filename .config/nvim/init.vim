call plug#begin('~/.config/nvim/plugged')
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'benjaminheng/vim-smyteql-syntax'
Plug 'benjaminheng/vim-githubbrowse'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'itchyny/lightline.vim'
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
Plug 'elubow/cql-vim'
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
set guicursor=
set inccommand=nosplit      " show substitutions incrementally, nvim only

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
command! -nargs=1 AgRaw call fzf#vim#ag_raw(<f-args>)

" Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips/"

" Plug 'itchyny/lightline.vim'
function! LightlineALEErrors()
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:error_counts = l:counts.error + l:counts.style_error
    return l:error_counts > 0 ? printf('E:' . '%d', l:error_counts) : ""
endfunction
function! LightlineALEWarnings()
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:warning_counts = l:counts.warning + l:counts.style_warning
    return l:warning_counts > 0 ? printf('W:' . '%d', l:warning_counts) : ""
endfunction
function! LightlineMode()
    return &filetype ==# 'fzf' ? 'FZF' : lightline#mode()
endfunction
function! LightlineFilename()
  let filename = @% !=# '' ? @% : '[No Name]'
  return &filetype ==# 'fzf' ? '' : filename
endfunction
function! LightlineFileformat()
  return winwidth(0) > 90 ? &fileformat : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 90 ? &fileencoding : ''
endfunction
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'right': [ [ 'lineinfo', 'truncate_here' ],
            \              [ 'linter_errors', 'linter_warnings' ],
            \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'inactive': {
            \   'right': [ [ 'lineinfo' ] ]
            \ },
            \ 'component': {
            \   'truncate_here': '%<',
            \ },
            \ 'component_function': {
            \   'filename': 'LightlineFilename',
            \   'fileformat': 'LightlineFileformat',
            \   'fileencoding': 'LightlineFileencoding',
            \   'mode': 'LightlineMode',
            \ },
            \ 'component_expand': {
            \   'linter_errors': 'LightlineALEErrors',
            \   'linter_warnings': 'LightlineALEWarnings',
            \ },
            \ 'component_type': {
            \   'linter_errors': 'error',
            \   'linter_warnings': 'warning',
			\   'truncate_here': 'raw',
            \ },
            \ 'component_visible_condition': {
			\   'truncate_here': 0,
            \ },
            \ }
autocmd User ALELint call lightline#update()

" Plugin 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.config/nvim/tags/'
let g:gutentags_ctags_exclude = ['node_modules', 'env', 'env2', 'vendor']
let g:gutentags_file_list_command = { 'markers': { '.git': 'git ls-files | grep -v "^vendor/"' } }
let g:gutentags_generate_on_empty_buffer = 1

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
let wiki.nested_syntaxes = {
            \ 'python': 'python',
            \ 'js': 'javascript',
            \ 'sql': 'sql',
            \ 'go': 'go',
            \ 'bash': 'sh',
            \ 'cql': 'cql',
            \ }
let g:vimwiki_list = [wiki]
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1

" Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_disable_when_zoomed = 1

" Plug 'fatih/vim-go'
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_gocode_unimported_packages = 1
augroup filetype_go
    autocmd!
    autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <leader>gr  <Plug>(go-run)
    autocmd FileType go nmap <leader>gi  <Plug>(go-info)
    autocmd FileType go nmap <leader>gt  <Plug>(go-test)
    autocmd FileType go nmap <leader>gT  <Plug>(go-test-func)
    autocmd FileType go nmap <leader>gtc  <Plug>(go-coverage-toggle)
    autocmd FileType go setlocal noexpandtab sw=8 ts=8
augroup END

" Plug 'machakann/vim-sandwich'
call operator#sandwich#set('delete', 'all', 'highlight', 0)
call operator#sandwich#set('add', 'all', 'highlight', 2)
call operator#sandwich#set('replace', 'all', 'highlight', 2)
nmap s <NOP>
xmap s <NOP>

" Plug 'tpope/vim-commentary'
autocmd FileType sqrl,gitcommit setlocal commentstring=#\ %s
autocmd FileType proto setlocal commentstring=//\ %s

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
augroup toggle_relative_number
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END
autocmd FileType javascript,sqrl,yaml,htmldjango,sql setlocal sw=2 ts=2
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType javascript nnoremap <silent> <leader>gf :call Prettier()<CR>
autocmd FileType qf wincmd J " quickfix window always at bottom

" Syntax highlighting overrides
"""""""""""""""""""""""""""""""""""""""""""""
hi Tag        ctermfg=04
hi xmlTag     ctermfg=04
hi xmlTagName ctermfg=04
hi xmlEndTag  ctermfg=04
hi xmlEqual   ctermfg=110

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
