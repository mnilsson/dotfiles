if has("gui_macvim")
    set guifont=Inconsolata:h14

    map <D-/> <plug>NERDCommenterToggle
    imap <D-/> <Esc><plug>NERDCommenterToggleli
    vmap <D-/> <plug>NERDCommenterTogglegv

    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    imap <D-t> <Esc>:CommandT<CR>

    set fuopt+=maxhorz
    colorscheme macvim
endif

set guioptions-=T
set guioptions-=lr

set background=dark
