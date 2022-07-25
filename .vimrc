"==================================================
"==                    Plugins                   ==
"==================================================
" Plugins
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
Plug 'prettier/vim-prettier', {'do': 'npm install'}
Plug 'shime/vim-livedown', {'do': 'npm install', 'for': 'markdown'}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'junegunn/gv.vim'

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
let g:livedown_browser = 'google-chrome-stable'
let g:livedown_port = 8080

" Ack settings
cnoreabbrev Ack Ack!
nnoremap <Space>f :Ack!<Space>

" emmet settings
let g:user_emmet_leader_key=','

"==================================================
"==                Nvim settings                  ==
"==================================================

" Common
syntax enable
filetype on
filetype plugin on
filetype plugin indent on
set spelllang=uk,en_us,ru

set nostartofline
set fileformat=unix
set splitright                  " Split vertical windows right to the current window
set splitbelow                  " Split horizontal windows below to the current window
set noerrorbells                " No beeps
set novisualbell
set nobackup
set writebackup
set noswapfile
set autoread
set autowrite                   " Automatically :write before running commands
set clipboard+=unnamedplus

" Colors
set t_Co=256
colorscheme ron
" highlight for vimdiff mode
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

" Tabs and spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

" Flie find
set path+=**                    " search down into subfolders. Prowides tab-completion for all file-related tasks
set wildmenu                    " enhanced command line completion
set wildignore+=**/node_modules/**
set hidden                      " current buffer can be put into background

" UI
set number
set relativenumber
set modelines=1
set cursorline
set culopt=number,screenline
set wrap
set linebreak
set nocursorcolumn
set colorcolumn=80
set signcolumn=auto
set showcmd                     " display incomplete commands
set cmdheight=1                 " command bar height
set showmatch                   " show matching braces
set list                        " Make whitespaces to visible (trailing by default)
set lcs+=space:·                " Whitespaces in a line
set autoindent
highlight Normal guibg=none

" Searching
set ignorecase                  " case insensitive searching
set smartcase                   " case-sensitive if expresson contains a capital letter
set hlsearch                    " highlight searching results
set incsearch                   " set incremental search

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" Commands
command! MakeTags !ctags -R .   " generate tags to 'go to definition' feature
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" Remaps
let mapleader = "\<Space>"
if has('nvim') " workaround for https://github.com/neovim/neovim/issues/2048
  nmap <BS> <C-W>h
endif

" Map ctrl-movement keys to window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" resizing window
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Edit .vimrc
map <leader>vl :vsp ~/.vimrc<CR>
map <leader>vr :source $MYVIMRC <bar> :doautocmd BufRead<CR>

" Fugitive git bindings
nmap <leader>gs :G status<CR>
nmap <leader>gc :G commit<CR>
nmap <leader>gb :G branch<CR>
nmap <leader>gB :G blame<CR>
nmap <leader>gC :G checkout<Space>
nmap <leader>gl :Glog<CR>
nmap <leader>gFl :GV<CR>
nmap <leader>gfl :GV!<CR>
nmap <leader>gp :Git push<Space>
nmap <leader>gP :Git pull<Space>
nmap <leader>gm :Git mergetool<CR>
nmap <leader>gd :Gvdiffsplit!<CR>
nmap <leader>ga :G<CR>
nmap <leader>gH :diffget //2<CR>  " get our changes
nmap <leader>gL :diffget //3<CR>  " get their changes

nnoremap <Space> <NOP>

" vim:foldmethod=marker:foldlevel=0
