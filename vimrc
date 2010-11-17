" we disable filetype before pathogen loads, for some reason
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype on
filetype plugin on
filetype indent on

set nocompatible
set modelines=0

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber

let mapleader=","

" set swp/tmp files to use a common location and stop cluttering up my
" directories
set backupdir=~/.vim/tmp,~/tmp,/tmp
set directory=~/.vim/tmp,~/tmp,/tmp

" disable arrow keys, otherwise i'll never learn
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" make vim's regexp sane
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault

" highlight search results
set incsearch
set showmatch
set hlsearch

" make ,CR clear search
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" ignores for NERDTree
set wildignore+=*.o,*.obj,.git,vendor/rails/**,user-data/**

" long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" font
set guifont=Menlo:h11

" clipboard
set clipboard=unnamed
