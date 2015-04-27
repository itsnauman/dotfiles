set nocompatible
filetype off
set t_Co=256
set guifont=Inconsolata:h14
set rtp+=~/.vim/bundle/Vundle.vim
" ---- Vundle Plugins Start ----
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'moll/vim-node'
Plugin 'Slava/vim-spacebars'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'powerline/powerline'
Plugin 'tell-k/vim-autopep8'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'marijnh/tern_for_vim'
Plugin 'klen/python-mode'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
" ---- Vundle Plugin End ----
colorscheme flattr


" ---- Configurations start from here ----

" NERD Tree
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0

" Powerline
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

" Python-mode
let g:pymode_rope = 1

"Linting
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>

" Basic Configurations
set textwidth=79 
set backspace=indent,eol,start
set number
set ruler
set cursorline
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set title         " change the terminal's title

" Default tabs and spaces
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "  shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

"make jj do esc"
inoremap jj <Esc>

" Enable filetype plugins and indention
filetype plugin indent on

" Python configurations
autocmd FileType python setlocal shiftwidth=4 expandtab tabstop=4 softtabstop=4
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python autocmd BufWritePre * :%s/\s\+$//e

" Tab width for Javascript code
autocmd FileType javascript setlocal sw=2 ts=2 sts=2

" Tab width for Coffeescript code
autocmd FileType coffeescript setlocal sw=2 ts=2 sts=2

" Ruby Configurations
autocmd filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=80

" PHP Configurations
autocmd FileType php setlocal colorcolumn=100

" CSS Configurations
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */

" HTML configurations
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab

" Ensure that JSON files have their filetype properly set.
au BufRead,BufNewFile *.json set filetype=json

" more subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif
" ---- Configurations End ----
"
