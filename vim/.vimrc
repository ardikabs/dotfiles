" This must be first, because it changes other options as side effect
set nocompatible

" -----------------------------------------------------
" Plugin Section
" -----------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

call plug#begin('~/.vim/plugged')

" List bundles here

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-git'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'

call plug#end()

" -----------------------------------------------------
" Plugin Configuration
" -----------------------------------------------------

" Plugin:NERDTree {{
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" }}

" Plugin:vim-airline {{
let g:airline_theme="durant"
let g:airline_powerline_fonts=1
" }}

" Plugin:IndentLine {{
"let g:indentLine_char_list = ['¦', '┆', '┊']
"let g:indentLine_first_char = '|'
"let g:indentLine_bgcolor_term = 233
"let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_setColors = 0
" }}

" Plugin:Fzf {{
" This is the default extra key bindings
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" File path completion in Insert mode using fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)

" Use preview when FzfFiles runs in fullscreen
command! -nargs=? -bang -complete=dir FzfFiles
      \ call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%') : {}, <bang>0)

" Key binding
nnoremap <silent> <leader>o :FzfFiles<CR>
nnoremap <silent> <leader>O :FzfFiles!<CR>
nnoremap <silent> <leader>l :FzfBuffers<CR>
nnoremap <silent> <leader>b :FzfBLines<CR>
nnoremap <silent> <leader>` :FzfMarks<CR>
nnoremap <silent> <leader>p :FzfCommands<CR>
nnoremap <silent> <leader>t :FzfFiletypes<CR>

nnoremap <silent> <leader>g :FzfGFiles<CR>
nnoremap <silent> <leader>f :FzfRg!<CR>
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
set clipboard=unnamedplus       " yank to clipboard
set pastetoggle=<F2>            " integrate F2 as paste toggle
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Remap section
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap <silent> <leader>= :hid<CR>
nnoremap <silent> <leader>][ :nohl<CR>

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Deactivate arrow-key movement
map <up> <c-y>
map <down> <c-e>
" map <left> <nop>
" map <right> <nop>

" Efficient shortcut mappings
inoremap jk <Esc>

" Colorscheme
"set t_Co=256
"set termguicolors       " enable true colors support
"let ayucolor="mirage"   " for dark version of theme
"colorscheme ayu
"set colorcolumn=80,100
"highlight ColorColumn ctermbg=238 guibg=#23272

" Different tab/space stops
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype py setlocal noexpandtab
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
