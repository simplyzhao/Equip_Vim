" ############################################################################
"                                  .vimrc
" Author: Alex Zhao 
" Email:  simplyzhao@gmail.com
" ############################################################################


" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Bundle
" required! 
Bundle 'gmarik/vundle'

" Bundle 
Bundle 'wombat256.vim'
Bundle 'L9'
Bundle 'Townk/vim-autoclose'
Bundle 'ctrlp.vim'
Bundle 'snipMate'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'simplyzhao/cscope_maps.vim.git'
Bundle 'Rip-Rip/clang_complete'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","		  " change the mapleader from \ to ,

set shortmess=atI         " no startup prompt
colorscheme wombat256mod  " set colorscheme to 'desert'
set number		          " always show line numbers
set confirm
set ruler                 " show the line and column number
set noerrorbells          " be silent about invalid cursor moves and other errors
set novisualbell        
set textwidth=80          " each line contains maximum 80 characters
set wrap                  " auto wrap
set history=80            " remember more commands and search history
set undolevels=256        " use a large undo buffer
" characters to fill the statuslines and vertical separators
" set fillchars=vert:\ ,stl:\ ,stlnc:\
" strips off <Shift> for each Vim command
nnoremap ; :

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch              " highlight search terms
set ignorecase            " ignore case when searching
set smartcase             " ignore case if search pattern is all lowercase, case-sensitive otherwise
" clears the search buffer when you press ,/
nmap <silent> <leader>/ :nohlsearch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File and Edit Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                 " enable syntax
filetype plugin indent on " enable detection, plugins and indenting in one step
set expandtab             " always replace <tab> with spaces
" hide buffers instead of closing them
" the current buffer can be put to background without being written
set hidden
set nobackup              " never ever let Vim write a backup file
set noswapfile
set tabstop=4             " a tab is four spaces
set softtabstop=4
set shiftwidth=4          " number of spaces to use for autoindenting
" allow backspacing over everything in insert mode
set backspace=indent,eol,start    
set autoindent            " always set autoindenting on
set smartindent
" with line wrapping enabled, this solves the problem that 
" pressing down jumpes your cursor “over” the current line to the next line. 
" changes behaviour so it jumps to the next row in the editor(more natural)
nnoremap j gj
nnoremap k gk
" when you forgot to sudo before editing a file that requires root privileges
" this lets you use w!! to do that after you opened the file already
cmap w!! w !sudo tee % >/dev/null
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags
" also you can create and load tags for /usr/include directory automatically, 
" however may slow down the speed, the best way is load when really needed
set tags=tags " load tags from current directory
set tags+=../tags " load tags from parent's directory

" cscope
" see: .vim/bundle/cscope_maps/plugin/cscope_maps.vim for keyboard mapping
" cscope_maps.vim also load cscope.out from current directory or $CSCOPE_DB
if has('cscope')
    cnoreabbrev csf cs find
endif

" taglist
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Exist_OnlyWindow = 1
let Tlist_Show_One_File = 1   
let Tlist_Use_SingleClick = 1 
nmap tl :TlistToggle<cr>
 
" nerdtree
let g:NERDTree_title="[NERDTree]"
let g:NERDTreeDirArrows=0
nmap nd :NERDTreeToggle<cr>

" vim-powerline
set t_Co=256
set encoding=utf-8
set laststatus=2
let g:Powerline_symbols = 'unicode'

" ctrlp 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 24
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 18000
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" clang-complete
set completeopt=longest,menu
let g:clang_library_path = '/usr/lib/'
let g:clang_use_library = 1
let g:clang_auto_select = 0
