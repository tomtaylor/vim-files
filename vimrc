set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

let mapleader=","

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" disable arrow keys, otherwise i'll never learn
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

set ruler

syntax on
filetype on
filetype plugin on
filetype indent on

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

