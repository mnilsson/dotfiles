call pathogen#runtime_append_all_bundles()
set nocompatible

filetype plugin indent on

set number
set ruler
syntax on

set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list listchars=tab:\ \ ,trail:·
set smartindent

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=.git

let mapleader = ','

map <Leader>n :NERDTreeToggle<CR>
map <Leader><Leader> :ZoomWin<CR>


map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

set nobackup
set nowritebackup
set directory-=.

set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
