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

call plug#end()

syntax on
filetype plugin indent on
filetype on

set nocompatible
set backspace=indent,eol,start
set encoding=utf-8
set mouse=a
set cursorline
set autoread
set ignorecase
set re=1
set paste
set modelines=0
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set clipboard=unnamed " yank to clipboard

set autoindent
set smartindent

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

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
