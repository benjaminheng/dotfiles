set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Add plugins below
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'digitaltoad/vim-jade'
Plugin 'Raimondi/delimitMate'
call vundle#end()
filetype plugin indent on

" General stuff
"""""""""""""""""""""""""""""""
set t_Co=256
set encoding=utf-8
set fileencoding=utf-8
colorscheme jellybeans
filetype on
syntax on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set laststatus=2
set number 
set relativenumber
set ignorecase
set smartcase

" Variable definitions
"""""""""""""""""""""""""""""""
let &showbreak = repeat(' ', 3)
let mapleader = ","
let g:airline_powerline_fonts=1

let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_indent=1
let g:tagbar_expand=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#checks = ['indent']
let g:airline_powerline_fonts = 1
let g:ctrlp_regexp = 1
let g:ctrlp_prompt_mappings = { 'PrtAdd(".*")': ['<space>'] }
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = { 'dir': 'node_modules' }
let g:syntastic_python_checkers = ['pyflakes']

" Auto-commands
"""""""""""""""""""""""""""""""
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Mappings
"""""""""""""""""""""""""""""""
nmap <F7> :TagbarToggle<CR>
nmap <Leader>f :CtrlP<Space>
nmap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>

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

" clear search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>
