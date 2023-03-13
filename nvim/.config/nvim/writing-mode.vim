call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'w0rp/ale', {'commit': 'bbe5153f'}
Plug 'terryma/vim-expand-region'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
Plug 'rhysd/vim-grammarous'
Plug 'NLNguyen/papercolor-theme'
call plug#end()
filetype plugin indent on
filetype indent on

" set encoding=utf-8
" set fileencoding=utf-8
set backupdir=/tmp
set directory=/tmp

" General options
"""""""""""""""""""""""""""""""""""""""""""""
set background=light
colorscheme PaperColor
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
set nofoldenable            " disable folding unless enabled using `zi`
set noshowcmd

" Persistent undo
set undodir=~/.config/nvim/undodir
set undofile

" Variable definitions
"""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" tpope's markdown syntax highlighting
let g:markdown_fenced_languages = ['json', 'go', 'sql', 'diff', 'dot']

" Plug 'junegunn/fzf.vim'
" respect .gitignore, among others
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_preview_window = ''
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'top' } }
command! -nargs=1 AgRaw call fzf#vim#ag_raw(<f-args>)
autocmd FileType fzf setlocal nonumber norelativenumber

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
            \ 'colorscheme': 'PaperColor',
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
            \   'currenttag': 'TagbarCurrentTag',
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

" Plugin 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.config/nvim/tags/'
let g:gutentags_ctags_exclude = ['node_modules', 'env', 'env2', 'vendor']
let g:gutentags_file_list_command = { 'markers': { '.git': 'git ls-files | grep -v "^vendor/" | grep -v ".pb.go$"' } }
let g:gutentags_generate_on_empty_buffer = 1
let g:gutentags_project_root = ['.gutentags']

" Neovim-related options
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/Users/benheng/.pyenv/shims/python3'

" Plug 'terryma/vim-expand-region'
" Use v and C-v to increase and decrease region expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Plug 'jungunn/goyo.vim'
function! s:goyo_enter()
    autocmd InsertLeave * :set norelativenumber
endfunction
function! s:goyo_leave()
    autocmd InsertLeave * :set relativenumber
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Plug 'machakann/vim-sandwich'
call operator#sandwich#set('delete', 'all', 'highlight', 0)
call operator#sandwich#set('add', 'all', 'highlight', 2)
call operator#sandwich#set('replace', 'all', 'highlight', 2)
nmap s <NOP>
xmap s <NOP>

" Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nnoremap <silent> <Leader>gy :Goyo<CR>
augroup filetype_markdown
    autocmd!
    " Format markdown table
    autocmd Filetype markdown nmap <leader>gft gaip*<Bar>
augroup END

" Auto-commands
"""""""""""""""""""""""""""""""""""""""""""""
augroup toggle_relative_number
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END
autocmd FileType qf wincmd J " quickfix window always at bottom

" Syntax highlighting overrides
"""""""""""""""""""""""""""""""""""""""""""""
" hi Tag        ctermfg=04
" hi xmlTag     ctermfg=04
" hi xmlTagName ctermfg=04
" hi xmlEndTag  ctermfg=04
" hi xmlEqual   ctermfg=110

" Mappings
"""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'junegunn/fzf.vim'
nnoremap <silent> <Leader>t :Tags<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <Leader>a :Ag 
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>lt :BTags<CR>
nnoremap <silent> <Leader>la :BLines<CR>

nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk
nnoremap <silent> <Leader>gs :set spell!<CR>
nnoremap <silent> <Leader>gc :GrammarousCheck<CR>

nnoremap <Leader>mt :NERDTreeToggle<CR>

" Start a project-wide search for the current word (<C-R><C-W> == expand('<cword>'))
nnoremap <Leader>* :Ag <C-R><C-W><CR>

" Start a project-wide search for the selected text in visual mode
vnoremap <Leader>* y<CR>:Ag <C-R>"

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
