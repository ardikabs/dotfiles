" This must be first, because it changes other options as side effect
set nocompatible
filetype off

" -----------------------------------------------------
" Plugin Section
" -----------------------------------------------------
" Set up Vundle on first install - Vundle, in turn, installs all other plugins
set exrc
set secure

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" List bundles here

Plugin 'gmarik/vundle'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'ayu-theme/ayu-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Yggdroot/indentLine'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" end of vundle setup

" -----------------------------------------------------
" Plugin Configuration
" -----------------------------------------------------

" NERDTree {{
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" }}

" IndentLine {{
let g:indentLine_char_list = ['¦', '┆', '┊']
let g:indentLine_first_char = '|'
let g:indentLine_bgcolor_term = 233
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

" -----------------------------------------------------
" VIM Configuration
" -----------------------------------------------------
" General
syntax on
filetype plugin indent on
set encoding=utf-8
set backspace=indent,eol,start
set nobackup             " prefer not to write backup
set noswapfile           " prefer not to write swapfile
set nowritebackup        " prefer not to write backup
set ffs=unix,dos,mac     " This is what files look like
set path=$PWD/**         " Update find path to search subdirectories
set mouse=a              " Disable mouse

" History
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" Display
set ttyfast
set title
set ls=2
set showmode
set showcmd
set modeline
set ruler
set number
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
set autoindent                  " auto indent
set smartindent                 " smart indent
set smarttab                    " smart tab

" Optional
set autochdir                   " automatically change window's cwd to file's dir
set clipboard=unnamed           " yank to clipboard
set pastetoggle=<F2>            " integrate F2 as paste toggle
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

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
nnoremap <silent> <leader>][ :nohl<CR>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Efficient shortcut mappings
inoremap jk <Esc>

" Colorscheme
set t_Co=256
set termguicolors     " enable true colors support
let ayucolor="mirage"   " for dark version of theme
colorscheme ayu
" set colorcolumn=80,100
" highlight ColorColumn ctermbg=238 guibg=#23272

" Different tab/space stops
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make setlocal noexpandtab

" -----------------------------------------------------
" Files to exclude
" -----------------------------------------------------
" Python
set wildignore+=*.pyc,*.pyo,*/__pycache__/*
" Erlang
set wildignore+=*.beam
" Temp files
set wildignore+=*.swp,~*
" Archives
set wildignore+=*.zip,*.tar
