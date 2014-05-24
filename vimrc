" ############################################################################
"                                  .vimrc
" Author: Alex Zhao 
" Email:  simplyzhao@gmail.com
" ############################################################################

let mapleader = ","       " change the mapleader from \ to ,
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

" hide buffers instead of closing them
" the current buffer can be put to background without being written
set hidden
set nobackup              " never ever let Vim write a backup file
set noswapfile
set autoread              " auto-read file if it's modified outside of Vim

" allow backspacing over everything in insert mode
set backspace=indent,eol,start    

set completeopt=longest,menu

set wildmenu

" files ignored
set wildignore=*.o,*~,*.pyc,*.class

" ============================================================================
" Display Setting
" ============================================================================

set background=dark
colorscheme solarized     " colorscheme
set t_Co=256

set number                " always show line numbers
set ruler                 " show the line and column number
set showcmd               " show command
set showmode              " show mode

set nowrap                " nowrap

set scrolloff=5           " make context visible when moving cursor

set hlsearch              " highlight search terms
set ignorecase            " ignore case when searching
set smartcase             " ignore case if search pattern is all lowercase, case-sensitive otherwise

" ============================================================================
" File and Format Setting
" ============================================================================

filetype plugin indent on " enable detection, plugins and indenting in one step

set tabstop=4             " a tab is four spaces
set softtabstop=4
set shiftwidth=4          " number of spaces to use for autoindenting
set expandtab             " always replace <tab> with spaces
set smarttab

set autoindent            " always set autoindenting on
set smartindent

set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set ffs=unix,dos,mac

" ============================================================================
" Key Mappings
" ============================================================================

" Use <F2> to enable/disable line numbers which is useful when copying
function! HideNumber()
    if(&number)
        set number!
    else
        set nonumber!
    endif
endfunc
nnoremap <F2> :call HideNumber()<CR>

" strips off <Shift> for each Vim command
nnoremap ; :

" go to Home and End using capitalized directions
noremap H ^
noremap L $

" clears the search buffer when you press ,/
nmap <silent> <leader>/ :nohlsearch<CR>

" with line wrapping enabled, this solves the problem that 
" pressing down jumpes your cursor “over” the current line to the next line. 
" changes behaviour so it jumps to the next row in the editor(more natural)
nnoremap j gj
nnoremap k gk

" Ctrl+<move> to move around windows, instead of using Ctrl+w+<move>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" replace <Esc> with kj
inoremap kj <Esc>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" select all
map <Leader>sa ggVG"
" select block
nnoremap <leader>v V`}

" when you forgot to sudo before editing a file that requires root privileges
" this lets you use w!! to do that after you opened the file already
cmap w!! w !sudo tee % >/dev/null

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" ============================================================================
" Others
" ============================================================================

if has('cscope')
    cnoreabbrev csf cs find
endif

" ctags
" also you can create and load tags for /usr/include directory automatically, 
" however may slow down the speed, the best way is load when really needed
set tags=tags " load tags from current directory
set tags+=../tags " load tags from parent's directory
