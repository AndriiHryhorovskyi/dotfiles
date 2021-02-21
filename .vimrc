"==================================================
"==                    Plugins                   ==
"==================================================
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'shime/vim-livedown', {'for': 'markdown'} " need npm i -g livedonw
Plug 'prettier/vim-prettier', {'do': 'npm install'}
Plug 'mattn/emmet-vim', {'for': 'html'}

" Initialize plugin system
call plug#end()

"==================================================
"==               Plugins settings               ==
"==================================================
" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMinimalMenu=1
let g:NERDTreeIgnore = ['^node_modules$']

" Airline settings
let g:airline_powerline_fonts=1
let g:airline_theme="minimalist"

" gitgutter settings
set updatetime=500

" ctrlp settings
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "ignore files in .gitignore
let g:ctrlp_show_hidden = 1

" auto-pairs settings
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<C-b>'

" ale settings
let g:ale_fixers = {'javascript':['eslint','prettier'],'*':['remove_trailing_lines','trim_whitespace','prettier']}
let g:ale_linters = {'javascript':['eslint']}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 0
let g:ale_history_enabled = 0
let g:ale_history_log_output = 0
let g:ale_ling_on_save = 0
let g:ale_open_list=1
let g:ale_keep_list_window_open = 0
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)
nmap <C-\> <Plug>(ale_fix)

" vim-prettier settings
let g:prettier#config#trailing_comma = 'all'
let g:prettier#autoformat = 0
nmap <Space>\ <Plug>(Prettier)

" livedown settings
let g:livedown_browser = 'chromium'
let g:livedown_port = 8080

" Ack settings
cnoreabbrev Ack Ack!
nnoremap <Space>f :Ack!<Space>

" emmet settings
let g:user_emmet_leader_key=','

"==================================================
"==                Vim settings                  ==
"==================================================
set list "make whitespaces to visible (trailing by default)
set lcs+=space:· "whitespaces in a line
set autoread
syntax enable
set t_Co=256
set fileformat=unix
set encoding=UTF-8

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set number
set wrap
set linebreak

set nocursorline
set nocursorcolumn
set lazyredraw                  " Don't redraw while executing macros (good performance config)
set ttyfast
set nocompatible 								" not compatible with vi
set autowrite                   " Automatically :write before running commands

set wildmenu 										" enhanced command line completion
set hidden 											" current buffer can be put into background
set showcmd                     " display incomplete commands
set cmdheight=1 								" command bar height

set splitright                  " Split vertical windows right to the current window
set splitbelow                  " Split horizontal windows below to the current window

" set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбю.ЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ\\,;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,./~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>?

set noerrorbells                " No beeps
set novisualbell
set nobackup                    " Turn backup off, since most stuff is in SVN, git etc anyway...
set nowritebackup
set nowb
set noswapfile

" searching
set ignorecase									" case insensitive searching
set smartcase 									" case-sensitive if expresson contains a capital letter
set hls													" highlight searching results
set is													" set incremental search
set showmatch 									" show matching braces


" nvim setup
" workaround for https://github.com/neovim/neovim/issues/2048
if has('nvim')
  nmap <BS> <C-W>h
endif

" Map ctrl-movement keys to window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let mapleader = "\<Space>"

" resizing window
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>y "+y

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Edit .vimrc
map <leader>vl :vsp $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>

nnoremap <Space> <NOP>
" highlight in vimdiff mode
hi DiffAdd ctermfg=40 ctermbg=none cterm=NONE
hi DiffChange ctermfg=none ctermbg=none cterm=NONE
hi DiffDelete ctermfg=red ctermbg=none cterm=NONE
hi DiffText ctermfg=black ctermbg=179 cterm=NONE
" alternative diff mode highlight config
" hi DiffAdd ctermfg=black ctermbg=106 cterm=NONE
" hi DiffChange ctermfg=black ctermbg=186 cterm=NONE
" hi DiffDelete ctermfg=black ctermbg=red cterm=NONE
" hi DiffText ctermfg=black ctermbg=179 cterm=NONE
"
