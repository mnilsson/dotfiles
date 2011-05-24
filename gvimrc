if has("gui_macvim")
    set guifont=Inconsolata:h14
    map <D-/> <plug>NERDCommenterToggle

    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    imap <D-t> <Esc>:CommandT<CR>

    set fuopt+=maxhorz
endif

set guioptions-=T
set guioptions-=lr

set background=light
colorscheme solarized
