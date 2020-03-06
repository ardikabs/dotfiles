" This must be first, because it changes other options as side effect
set nocompatible

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
set nobackup             " prefer not to write backup
set noswapfile           " prefer not to write swapfile

" History
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" Display
set title
set ls=2
set showmode
set showcmd
set modeline
set ruler
set nu
set relativenumber

" Line wrapping
set nowrap
set linebreak
set showbreak=▹

" Searching
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set showmatch                   " set show matching parenthesis
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type

" Indentation
set shiftwidth=4                " number of spaces to use for autoindenting with 4 columns
set tabstop=4                   " a tab is 4 spaces
set softtabstop=4               " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab                   " insert spaces when hitting TABs
set smartindent
set smarttab

" Disable mouse
set mouse=a

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

" Remap section
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Efficient shortcut mappings
nnoremap ; :

" Optional
colorscheme ayu
color desert
let ayucolor="mirage"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
