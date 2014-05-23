" ############################################################################
"                                  .vimrc
" Author: Alex Zhao 
" Email:  simplyzhao@gmail.com
" ############################################################################

let mapleader = ","		  " change the mapleader from \ to ,
syntax on                 " enable syntax

" ============================================================================
" Plugin Loading
" ============================================================================

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" ============================================================================
" General Setting
" ============================================================================

set shortmess=atI         " no startup prompt

set confirm
set noerrorbells          " be silent about invalid cursor moves and other errors
set novisualbell        

set history=80            " remember more commands and search history
set undolevels=256        " use a large undo buffer

" ============================================================================
" Display Setting
" ============================================================================

set background=dark
colorscheme solarized     " colorscheme
set t_Co=256

set number		          " always show line numbers
set ruler                 " show the line and column number

set textwidth=80          " each line contains maximum 80 characters
set wrap                  " auto wrap

" hide buffers instead of closing them
" the current buffer can be put to background without being written
set hidden
set nobackup              " never ever let Vim write a backup file
set noswapfile

" ============================================================================
" File and Edit Setting
" ============================================================================

filetype plugin indent on " enable detection, plugins and indenting in one step

set expandtab             " always replace <tab> with spaces
set tabstop=4             " a tab is four spaces
set softtabstop=4
set shiftwidth=4          " number of spaces to use for autoindenting

set autoindent            " always set autoindenting on
set smartindent

" allow backspacing over everything in insert mode
set backspace=indent,eol,start    

" with line wrapping enabled, this solves the problem that 
" pressing down jumpes your cursor “over” the current line to the next line. 
" changes behaviour so it jumps to the next row in the editor(more natural)
nnoremap j gj
nnoremap k gk

set hlsearch              " highlight search terms
set ignorecase            " ignore case when searching
set smartcase             " ignore case if search pattern is all lowercase, case-sensitive otherwise
" clears the search buffer when you press ,/
nmap <silent> <leader>/ :nohlsearch<CR>

" ============================================================================
" Others
" ============================================================================

" strips off <Shift> for each Vim command
nnoremap ; :

" Ctrl+<move> to move around windows, instead of using Ctrl+w+<move>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
" quickfix
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

if has('cscope')
    cnoreabbrev csf cs find
endif

" when you forgot to sudo before editing a file that requires root privileges
" this lets you use w!! to do that after you opened the file already
cmap w!! w !sudo tee % >/dev/null

" ctags
" also you can create and load tags for /usr/include directory automatically, 
" however may slow down the speed, the best way is load when really needed
set tags=tags " load tags from current directory
set tags+=../tags " load tags from parent's directory
