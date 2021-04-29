" Use , as our leader
let mapleader = ","

call plug#begin('~/.vim/plugged')
  Plug 'luochen1990/rainbow'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-projectionist'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', { 'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'prettier/vim-prettier', {  'do': 'yarn install', 'for': ['javascript', 'typescript' ] }
  " Colours
  Plug 'wadackel/vim-dogrun'
call plug#end()

filetype plugin indent on
set nocompatible
syntax enable
set encoding=utf-8
" Make things super fast? I don't know...
set ttyfast
set updatetime=300

" Line numbers
"set hidden
set cursorline
set number
set nowrap
set ruler

" Whitespace and indentation
set tabstop=2
set shiftwidth=2
set expandtab
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
"nnoremap <tab> %
"vnoremap <tab> %

" Always work a little from the edge of the screen
set scrolloff=5
set sidescrolloff=5
set mat=3

" GUI stuff
colorscheme dogrun
set clipboard=unnamed

" Foldmethod - indenting is sensible
set foldmethod=indent
set nofoldenable
set foldlevel=1

" Hit backspace on a word to ACK for it
nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr>

" Show some options when using tab-completion
set wildmenu
set wildmode=list:longest

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

nnoremap <leader>t :tabn<cr>

" Load Rainbow Parentheses by default
let g:rainbow_active = 1

" Random aliases
command! Wad :e ~/src/duffelhq/platform
command! NTT :NERDTreeFind %
command! JSON :%!python -m json.tool
command! XML :%!xmllint -format %

let g:ctrlp_custom_ignore = 'vendor\|git\|_build\|tmp'

" coc-elixir
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif"
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
" coc completions: https://github.com/neoclide/coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" trigger compltion with c-space
inoremap <silent><expr> <c-@> coc#refresh()
nnoremap gf :Dispatch! mix format %<cr>

" Use D to show documentation in preview window.
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use ag over grep
" https://thoughtbot.com/blog/faster-grepping-in-vim
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
" Use K as a shortcut for ag'ing the current word
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Adds an :Ag command for arbitrary searches
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap <C-p> :FZF<CR>
let g:fzf_layout = { 'down': '40%' }

function g:GetRelativePath()
  let @+ = substitute(expand('%:p'), getcwd() . "/", "", "")
endfunction
nnoremap <leader>p :call g:GetRelativePath()<CR>

function g:GetRelativePathAndLineNumber()
  let @+ = substitute(expand('%:p'), getcwd() . "/", "", "") . ":" . line(".")
endfunction
nnoremap <leader>n :call g:GetRelativePathAndLineNumber()<CR>
