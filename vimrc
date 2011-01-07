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

set backupdir=~/.vim/backup
set directory=~/.vim/backup
