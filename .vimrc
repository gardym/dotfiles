let mapleader = ","

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/rainbow_parentheses.vim'
Plug 'prettier/vim-prettier'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'ntk148v/vim-horizon'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'bluz71/vim-nightfly-guicolors'
call plug#end()

set nocompatible
set encoding=utf-8

syntax on
syntax enable
filetype plugin indent on

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
"colorscheme vividchalk
set background=dark
"colorscheme dracula
set termguicolors
colorscheme nightfly
"
"colors horizon
"set guifont=Menlo\ Regular:h10
"set guioptions-=T
set clipboard=unnamed

" Foldmethod - indenting is sensible
set foldmethod=indent
set nofoldenable
set foldlevel=1

" Show some options when using tab-completion
set wildmenu
set wildmode=list:longest

" Make things super fast? I don't know...
set ttyfast
set lazyredraw
set splitbelow
set splitright

" Always show the status bar
set laststatus=2
set showcmd

" Don't use crazy VIM Regex, just the normal ones please
nnoremap / /\v
vnoremap / /\v

nnoremap j gj
nnoremap k gk
nnoremap <leader>n :tabn<cr>

" Load RP by default, and toggle it with ,r
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_fmt_command = "gofmt"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_loclist_height = 10
let g:go_quickfix_height = 10
let g:go_list_height = 10
let g:go_jump_to_error = 0
nnoremap <leader>b :GoBuild<cr>


command! NT :NERDTree
command! NTT :NERDTree %
command! NTF :NERDTreeFind %

command! JSON :%!python -m json.tool

hi Normal ctermbg=none

if has("statusline")
  set statusline=[%n]                                 " buffer no
  set statusline+=\ %<%.99f                           " Filename
  set statusline+=\ %h%m%r%w                          " Flags
  set statusline+=%=                                  " right align
  set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}]   " Encoding
  set statusline+=\ %y                                " Filetype
  set statusline+=\ [%{&ff}]                          " Fileformat
  set statusline+=\ %-3.c\ %P\                        " Column and Percentage
endif

set laststatus=2  " always show the status bar
set showmode
set shortmess=atIOT   " Abbrev. of messages (avoids 'hit enter')
set showcmd

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ag<SPACE>
"
" bind K to grep word under cursor
nnoremap " :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

