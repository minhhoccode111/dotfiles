"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""SETTINGS""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
" exmap back obcommand app:go-back
" exmap forward obcommand app:go-forward
" map <C-i> :back
" map <C-o> :forward

" Yank to system clipboard
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""SETTINGS""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Normal vim backspace vim behaviour, instead of find and replace
imap <C-h> <BS>

" act like enter
imap <C-m> <CR>

" Enter Normal mode from Insert mode with jj
inoremap jj <Esc>

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
nnoremap O o<Esc>

" Select all with <C-a>
inoremap <C-a> <Esc>ggVG
vnoremap <C-a> <Esc>ggVG
nnoremap <C-a> ggVG

" move line instead of paragraph
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""KEYMAPS COMMAND""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Esc in Normal mode turn off high light
nmap <Esc> :nohl<CR>

exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" Here's an example config that implements many of the features from vim-surround:
" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki
nunmap s
vunmap s
map s" :surround_double_quotes
map s' :surround_single_quotes
map s` :surround_backticks
map sb :surround_brackets
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map s[ :surround_square_brackets
map s{ :surround_curly_brackets
map s} :surround_curly_brackets
