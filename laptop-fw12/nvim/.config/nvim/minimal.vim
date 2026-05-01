filetype on
syntax on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set hlsearch

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
