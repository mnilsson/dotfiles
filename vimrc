set nocompatible
filetype off "required for vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'rails.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'Markdown'
Bundle 'ZoomWin'

filetype plugin indent on

set number
set ruler
syntax on

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

map <Leader><Leader> :ZoomWin<CR>


map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

set nobackup
set nowritebackup
set directory-=.

set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}
set statusline+=%*
set statusline+=%=%-14.(%l,%c%V%)\ %P

autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType c,cpp,h,yacc,*.y setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

set mouse=a
set background=dark
