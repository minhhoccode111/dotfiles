"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""SETTINGS""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality
set nocompatible

" Turn on syntax highlighting
syntax on

" Disable the default Vim startup message
set shortmess+=I

" Always show the status line at the bottom, even if you only have one window open
set laststatus=2

" Enable searching as you type, rather than waiting till you press enter
set incsearch

" Unbind some useless/annoying default key bindings
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this

" Disable audible bell because it's annoying
set noerrorbells visualbell t_vb=

" Set <space> as the leader key
let mapleader = " "
let maplocalleader = " "

" Make line numbers default
set number
set relativenumber

" Enable mouse mode
set mouse=a

" Don't show the mode
set noshowmode

" Enable 24-bit RGB
set termguicolors

" Color Scheme
colorscheme evening

" Display a line at column 80
set colorcolumn=80

" Sync clipboard between OS and Neovim
set clipboard=unnamedplus

" Enable break indent
set breakindent

" Indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Save undo history
set undofile

" Case-insensitive searching UNLESS \C or capital letters in the search term
set ignorecase
set smartcase

" Keep signcolumn on by default
set signcolumn=yes

" Decrease update time
set updatetime=50

" Decrease mapped sequence wait time
set timeoutlen=250

" Configure how new splits should be opened
set splitright
set splitbelow

" Set whitespace characters
set list
set listchars=tab:»\ ,trail:·,nbsp:␣

" Show which line your cursor is on
set cursorline

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=6

" Set highlight on search
set hlsearch

" Clear search highlight on pressing <Esc> in normal mode
nnoremap <Esc> :nohlsearch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""KEY MAPS""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enter Normal mode from Insert mode with jj
inoremap jj <esc>

" Center cursor after moving screen
nnoremap n nzzzv
nnoremap N Nzzzv

" H, K, L for line navigation
nnoremap H ^
onoremap H ^
vnoremap H ^

nnoremap L $
onoremap L $
vnoremap L $

nnoremap K %

" Insert new line above and stay in Normal mode
nnoremap O o<esc>

" Select all with <C-a>
inoremap <C-a> <esc>ggVG
vnoremap <C-a> <esc>ggVG
nnoremap <C-a> ggVG

" Paste over selected text without losing current clipboard
xnoremap <Leader>p "_dP

" Window navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
" Split window
nnoremap <Leader>_ :sp<cr>
nnoremap <Leader>\| :vsp<cr>

" Save file with <C-s>
inoremap <C-s> <cmd>w<cr>
nnoremap <C-s> <cmd>w<cr>

" Join line below but keep cursor position the same
nnoremap J mzJ`z

" Move selected lines in Visual mode
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Move line in Normal mode
nnoremap <M-j> V:m '>+1<CR>gv=gv<esc>
nnoremap <M-k> V:m '<-2<CR>gv=gv<esc>

" Source current file
nnoremap <Leader>S :so<cr>

" Close window
nnoremap <Leader>xx :q<cr>
nnoremap <Leader>xa :qa<cr>

" Close current buffer
nnoremap <Leader>xb :bd<cr>

" Cycle through buffers
nnoremap <C-o> :bn<cr>
nnoremap <C-i> :bp<cr>

" Toggle line numbers
nnoremap <Leader>tn :set nu!<cr>
nnoremap <Leader>tr :set rnu!<cr>

" Toggle line wrap
nnoremap <Leader>tw :set wrap!<cr>

" Diagnostic navigation (if supported)
nnoremap <Leader>k :lua vim.diagnostic.goto_prev()<cr>
nnoremap <Leader>j :lua vim.diagnostic.goto_next()<cr>
nnoremap <Leader>de :lua vim.diagnostic.open_float()<cr>
nnoremap <Leader>dq :lua vim.diagnostic.setloclist()<cr>
