" #################### SETTINGS ####################
" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
" exmap back obcommand app:go-back
" exmap forward obcommand app:go-forward
" map <C-i> :back
" map <C-o> :forward

" Yank to system clipboard
set clipboard=unnamed

" Set leader key. Just use the <Space> in keymap 
" instead of setting leader key

" #################### KEYMAPS ####################
" jj in insert mode to enter normal mode
imap jj <Esc>

" Normal vim backspace vim behaviour, instead of find and replace
imap <C-h> <BS>

" act like enter
imap <C-m> <CR>

" select all
map <C-a> <Esc>ggVG

" basics movement and jumping 
noremap H ^
noremap L $
noremap K %

" Center cursor after moving screen 
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap n nzz
nnoremap N Nzz
nnoremap ) )zz
nnoremap ( (zz
nnoremap } }zz
nnoremap { {zz

" move line instead of paragraph
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" O works like o but don't exit normal mode
nmap O o<Esc>

" #################### KEYMAPS COMMAND ####################
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
