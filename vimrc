"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""SETTINGS""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality
set nocompatible
" Turn on syntax highlighting.
syntax on
" Disable the default Vim startup message.
set shortmess+=I

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start
" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" Enable searching as you type, rather than waiting till you press enter.
set incsearch
" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Set to true if you have a Nerd Font installed
" let g:have_nerd_font = 1

" Make line numbers default
set number
set relativenumber

" Enable mouse mode
set mouse+=a

" Don't show the mode
" set noshowmode

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
" set undofile

" Case-insensitive searching UNLESS \C or capital letters in the search term
set ignorecase
set smartcase

" Keep signcolumn on by default
set signcolumn=yes

" Decrease update time
set updatetime=50

" Decrease mapped equence wait time
set timeoutlen=1000

" Configure how new splits should be opened
set splitright
set splitbelow

" Set whitespace characters
set list
set listchars=tab:»\ ,trail:·,nbsp:␣

" Show which line your cursor is on
set cursorline

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=7

" Set highlight on search
set hlsearch

" Clear search highlight on pressing <Esc> in normal mode
nnoremap <Esc> :nohlsearch<CR>

" Set <space> as the leader key
let mapleader = " "
" let maplocalleader = "\<Space>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""KEY MAPS""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enter Normal mode from Insert mode with jj
inoremap jj <esc>

" Center cursor after moving screen
nnoremap n nzzzv
nnoremap N Nzzzv

" H, K, L
nnoremap H ^
onoremap H ^
vnoremap H ^

nnoremap L $
onoremap L $
vnoremap L $

nnoremap K %
onoremap K %
vnoremap K %

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

" Replace regex string current file
nnoremap <Leader>rr :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Toggle small things
nnoremap <Leader>tn :set nu!<cr>
nnoremap <Leader>tr :set rnu!<cr>
nnoremap <Leader>tw :set wrap!<cr>

" Exit terminal mode
tnoremap jj <C-\><C-n>

" Source current file
nnoremap <Leader>S :so<cr>

" Similar to neotree
nnoremap <Leader>nl :Ex<cr>

" Close window
nnoremap <Leader>xx :q<cr>
nnoremap <Leader>xa :qa<cr>

" Close current buffer
nnoremap <Leader>xb :bd<cr>

" Cycle through buffers
nnoremap <C-o> :bn<cr>
nnoremap <C-i> :bp<cr>

" Close current buffer
nnoremap <Leader>xb :bd<cr>

" Split window
nnoremap <Leader>_ :sp<cr>
nnoremap <Leader>\| :vsp<cr>

" Change window Width
" nnoremap <C-,> <C-w><
" nnoremap <C-.> <C-w>>

" Save file with <C-s>
inoremap <C-s> <cmd>w<cr>
nnoremap <C-s> <cmd>w<cr>

" Join line below but keep cursor position the same
nnoremap J mzJ`z

" when we press Alt the terminal send ^[ which will be \e
" set this will make the move whole line work
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
" Visual mode JK to move selected text
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
" Normal mode auto enter visual and exit after getting things done
nnoremap <M-j> V:m '>+1<CR>gv=gv<esc>
nnoremap <M-k> V:m '<-2<CR>gv=gv<esc>

