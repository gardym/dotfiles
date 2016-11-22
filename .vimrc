let mapleader = ","

call pathogen#infect()
filetype plugin indent on
set nocompatible
syntax enable
set encoding=utf-8

" Line numbers
"set hidden
set cursorline
set number
set nowrap

set tabstop=2
set shiftwidth=2
set expandtab
" Show whitespace ... and then KILL IT
set list
set listchars=tab:·\ ,trail:·,extends:»,precedes:«

set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]

" Ignore swaps and move backups
set undodir=~/.vim/tmp/undo//
set backup
set backupdir=~/.vim/tmp/backups
set writebackup
set noswapfile

" Search defaults, highlight /g by default etc etc
set hlsearch
set incsearch
set ignorecase
set smartcase
" Clear search with <leader><space>
nnoremap <leader><space> :set hlsearch! hlsearch?<cr>

" Use tab to jump between begin/end blocks
nnoremap <tab> %
vnoremap <tab> %

" Always work a little from the edge of the screen
set scrolloff=5
set mat=3

" GUI stuff
colorscheme vividchalk
set guifont=Menlo\ Regular:h10
set guioptions-=T
set clipboard=unnamed

" Foldmethod - indenting is sensible
set foldmethod=indent
set nofoldenable
set foldlevel=1

" Hit backspace on a word to ACK for it
nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr>

" Switch to last buffer
nnoremap <leader><leader> <c-^>

" Show some options when using tab-completion
set wildmenu
set wildmode=list:longest

" Make things super fast? I don't know...
set ttyfast

" Always show the status bar
set laststatus=2
set showcmd

" Don't use crazy VIM Regex, just the normal ones please
nnoremap / /\v
vnoremap / /\v

nnoremap j gj
nnoremap k gk

" Split and swap horizontally or vertically
nnoremap <leader>w <C-w>s<C-w>j
nnoremap <leader>v <C-w>v<C-w>l

" Load RP by default, and toggle it with ,r
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
nnoremap <leader>r :RainbowParenthesesToggle<cr>

nnoremap <leader>q :clo<cr>

" Remove trailing whitespace from a file
command! KillWhitespace :normal :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

command! NT :NERDTree

command! JSON :%!python -m json.tool

let g:ctrlp_custom_ignore = 'vendor\|git'
