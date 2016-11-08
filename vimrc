"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"

set nocompatible
filetype off
filetype plugin indent on
set t_Co=256
set guifont=monaco
set term=xterm-256color
set encoding=utf-8
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'delimitMate.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdcommenter'
Plugin 'toyamarinyon/vim-swift'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mattn/emmet-vim'
Plugin 'chriskempson/base16-vim'
Plugin 'jistr/vim-nerdtree-tabs'
call vundle#end()

colorscheme flattr

set mouse=a		   " Allows you to click around the text editor with your mouse to move the cursor
set textwidth=79
set number
set ruler
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set title         " change the terminal's title

" Default tabs and spaces
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set completeopt-=preview

" Spelling check
au FileType markdown set spell
au FileType html set spell

" Indentation by file type
au FileType markdown setl sw=4 ts=4 et
au FileType javascript setl sw=4 ts=4 et

" Ensure that JSON files have their filetype properly set.
au BufRead,BufNewFile *.json set filetype=json

" Handlebars
au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.hbs set filetype=html

" Swift
au BufNewFile,BufRead *.swift set filetype=swift

" Airline setup
set laststatus=2
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#non_zero_only = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" The following commands make the navigation keys work like standard editors
imap <silent> <down> <c-o>gj
imap <silent> <up> <c-o>gk
nmap <silent> <down> gj

" make jj do esc"
inoremap jj <Esc>

" map leader to space
let mapleader = "\<Space>"

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" delimitMate
let delimitMate_expand_cr=1

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala,javascript let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Map split view nagivation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Buffer Config

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>n :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>c :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>s :
