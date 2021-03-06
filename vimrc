" we disable filetype before pathogen loads, for some reason
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set runtimepath+=$GOROOT/misc/vim

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
set number
" disable included files in autocomplete
set complete-=i

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set background=dark
colorscheme vividchalk

let mapleader=","

" set swp/tmp files to use a common location and stop cluttering up my
" directories
set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

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
set gdefault

" make ,CR clear search
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" long lines
set nowrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile}    set ft=ruby

" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

au FileType go set softtabstop=4 tabstop=4 shiftwidth=4 noexpandtab

" In Makefiles, use real tabs, not tabs expanded to spaces
au FileType make set noexpandtab

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Ctrl-P
" Use project dir, not git dir
map <leader>f :CtrlP<F5><cr>
map <leader>F :CtrlP %%<F5><cr>
map <leader>b :CtrlPMRU<cr>
set wildignore+=.git,vendor/**,.svn,tmp,DerivedData,build,_build,*.pyc
" Ignore some folders and files for CtrlP indexing
 let g:ctrlp_custom_ignore = {
   \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp|deps$',
   \ 'file': '\.so$\|\.dat$|\.DS_Store$'
   \ }

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Automatically trim whitespace from the following files
autocmd BufWritePre *.py,*.rb,*.erb,*.css,*.scss :%s/\s\+$//e

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" toggle between buffers quickly
nnoremap <Leader><Leader> <C-^>

" aligning characters
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tab/\w:\zs/l0l1<CR>
vmap <Leader>a: :Tab/\w:\zs/l0l1<CR>
nmap <Leader>a, :Tabularize /[^,]\+,<CR>
vmap <Leader>a, :Tabularize /[^,]\+,<CR>
nmap <Leader>a<Space> :Tabularize /^\s*\S\+\zs/l0c1l0<CR>
vmap <Leader>a<Space> :Tabularize /^\s*\S\+\zs/l0c1l0<CR>

" for ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

" open splits opposite to vim's default which is a bit odd
set splitbelow
set splitright

" move splits quicker
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" don't deselect blocks after indenting
vnoremap < <gv
vnoremap > >gv

" scss syntax highlighting
au BufRead,BufNewFile *.scss set filetype=scss
" go syntax highlighting
au BufRead,BufNewFile *.go set filetype=go
" disable hard wrapping for Markdown files
au BufRead,BufNewFile *.md,*.markdown set wrap linebreak nolist textwidth=0 wrapmargin=0

" Use jsxhint for JS syntax
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:syntastic_scss_checkers = ['scss_lint']
