if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin section "
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', {'do': 'npm install'}
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'

call plug#end()

" General
syntax on
filetype plugin indent on
set encoding=utf-8
set backspace=indent,eol,start
set relativenumber

" History
set history=50

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu

" Line wrapping
set nowrap
set linebreak
set showbreak=▹

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Indentation
set shiftwidth=4                " operation >> indents 2 columns; << unindents 2 columns
set tabstop=4                   " a hard TAB displays as 2 columns
set softtabstop=4               " insert/delete 2 spaces when hitting a TAB/BACKSPACE
set shiftround
set expandtab                   " insert spaces when hitting TABs
set smartindent
set smarttab

" Disable mouse
set mouse=

" vim
set autochdir                   " automatically change window's cwd to file's dir
set autoindent                  " auto indent

" Colorscheme
if &t_Co == 256
    try
        color xoria256
    catch /^Vim\%((\a\+)\)\=:E185/
        " Oh well
    endtry
endif

set clipboard=unnamed " yank to clipboard
set pastetoggle=<F2>

" Remap section "
map <C-n> :NERDTreeToggle<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Optional
colorscheme ayu
color desert
let ayucolor="mirage"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
