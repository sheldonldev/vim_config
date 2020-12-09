set showcmd
set cmdheight=2
set pumheight=10        " Makes popup menu smaller "

set ruler               " Ruler in status line "
set laststatus=2        " Always display the status line "
set showmatch

set hidden              " Required to keep multiple buffers "

set encoding=UTF-8      " the encoding displayed "
set termencoding=UTF-8
set fileencoding=UTF-8  " The encoding written to file "

set splitbelow          " Horizontal splits will automatically be below "
set splitright          " Vertical splits will automatically be to the right "

set confirm             " raise an asking dialog instead of failling command when saving files "
set visualbell          " use visual bell instead of error beeping "
set t_vb=""             " set null to visualbell, now no warning anymore when hit the end of line "

set tabstop=2           " chars long "
set softtabstop=2       " spaces long "
set shiftwidth=2        " spaces if press > "
set expandtab           " convert tabs to spaces "
set smarttab            " Makes tabbing smarter will realize you have 2 vs 4 "
set autoindent
set smartindent         " try best job to indent for you "

set nu                  " nice line numbers "
set relativenumber      " relative line number "
set nowrap              " no wrap if line too long "

set noswapfile                  " no need swap because we use undodir "
set nobackup                    " no need backup either "
set undodir=~/.vim/undodir      " for save undo files "
set undofile                    " an undo file per file "

set incsearch                   " get result while entering "
set hlsearch                    " highlight searches "
set smartcase                   " case sensitive searching "

set clipboard=unnamed           " in MacOS, or use `unnamedplus` otherwise "

set iskeyword+=-        " treat dash separated words as a word text object"
set iskeyword+=@        " vue-on and css "

set path+=**  " search down for subfolders provides tab-completion for all file related tasks "
set wildmenu  " Now you can us search commands such as :find :b :h with Tab incompletion and Enter the match"

" --- blink bar ---"
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175


" --- set <leader> key --- "
let mapleader = " "


" --- Auto Complete Braces and Quotes ---

inoremap () ()<Esc>ha
inoremap <> <><Esc>ha

inoremap '' ''<Esc>ha
inoremap "" ""<Esc>ha
inoremap `` ``<Esc>ha

inoremap [] []<Esc>ha
inoremap [  [<CR>]<Esc>O

inoremap {} {}<Esc>ha
inoremap {  {<CR>}<Esc>O
inoremap {{ {{<space><space>}}<Esc>F<space>i
inoremap {% {%<space><space>%}<Esc>F<space>i


" --- Jump between windows --- "
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>


" --- quickly adjust window size --- "
nnoremap <silent> <leader>] :vertical resize +10<CR>
nnoremap <silent> <leader>[ :vertical resize -10<CR>
nnoremap <silent> <leader>= :resize +5<CR>
nnoremap <silent> <leader>- :resize -5<CR>
nnoremap <silent> <leader>ll :vertical resize 100<CR>
nnoremap <silent> <leader>hh :vertical resize 25<CR>
nnoremap <silent> <leader>kk :resize 35<CR>
nnoremap <silent> <leader>jj :resize 5<CR>


" --- Alternate way to indent and save, quit --- "
nnoremap <silent> <C-s>       mngg=GG`n<Esc>:wa<CR>
nnoremap <silent> <C-q>       :q<CR>


" --- netrw --- "
let g:netrw_liststyle = 1
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
" Quickly open netrw explorer "
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 25<CR>
