syntax on

set encoding=UTF-8      " the encoding displayed "
set fileencoding=UTF-8  " The encoding written to file "

set showcmd             " Always show command line "
set cmdheight=2         " Command line height is 2 "
set laststatus=2        " Always display the status line "
set showtabline=2       " Always display ths tab line "
set ruler               " Ruler in status line "
set pumheight=10        " Makes popup menu smaller "
set showmatch           " bracket match highlight "
set nu                  " nice line numbers "
set relativenumber      " relative line number "
set nowrap              " no wrap if line too long "
set hidden              " Required to keep multiple buffers "
set cursorcolumn
set cursorline

set splitright          " Vertical splits will automatically be to the right "
set splitbelow          " Horizontal splits will automatically be below "

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
set preserveindent

set noswapfile                  " no need swap because we use undodir "
set nobackup                    " no need backup either "
set undodir=~/.vim/undodir      " for save undo files "
set undofile                    " an undo file per file "

set incsearch                   " get result while entering "
set hlsearch                    " highlight searches "
set ignorecase                  " case ignore search "
set smartcase                   " case sensitive if Capital is typed "

set clipboard=unnamed           " in MacOS, or use `unnamedplus` otherwise "

set iskeyword+=-        " treat dash separated words as a word text object"
set iskeyword+=@        " vue-on and scss "

set path+=**  " search down for subfolders provides tab-completion for all file related tasks "
set wildmenu  " Now you can us search commands such as :find :b :h with Tab incompletion and Enter the match"

" --- colorscheme --- "
set t_Co=256
set termguicolors
set background=dark
colorscheme gruvdark

" --- keybindings --- "
set timeoutlen=500
let mapleader = " "

" Auto Complete Braces and Quotes "
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

" put cursor middle of the screen after up and down "
nnoremap <silent> <C-d>   Lzz
nnoremap <silent> <C-u>   Hzz
nnoremap <silent> G       Gzz

" quickly open :vert h "
nnoremap <silent> <leader>vh       :vert h<space>

" open netrw "
let g:netrw_liststyle = 1
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
let g:netrw_banner = 0
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 25<CR>

" Jump between windows "
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>

" quickly adjust window size "
nnoremap <silent> <leader>] :vertical resize +10<CR>
nnoremap <silent> <leader>[ :vertical resize -10<CR>
nnoremap <silent> <leader>= :resize +5<CR>
nnoremap <silent> <leader>- :resize -5<CR>
nnoremap <silent> <leader>ll :vertical resize 105<CR>
nnoremap <silent> <leader>hh :vertical resize 30<CR>
nnoremap <silent> <leader>kk :resize 35<CR>
nnoremap <silent> <leader>jj :resize 5<CR>

" formmatting, quit, save "
nnoremap <silent> <leader>i       mngg=G`nzz

fun! TrimWhite()
  let l:save = winsaveview()
  keeppatterns %s/\s\s\+$//e
  keeppatterns %s/\n\{3,}/\r\r\r/e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhite()

nnoremap <silent> <C-q>           :q<CR>
nnoremap <silent> <leader><C-q>   :bd<CR>
nnoremap <silent> <C-s>           :wa<CR>
nnoremap <silent> <C-c>           <Esc>

" --- statusline --- "
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
let l:branchname = GitBranch()
return strlen(l:branchname) > 0 ? ' '.l:branchname :''
endfunction

set statusline=
set statusline+=%#PmenuThumb#
set statusline+=\ %{StatuslineGit()}\ 
set statusline+=%#TabLine#
set statusline+=
set statusline+=\ %f\ %m\ %R\ 
set statusline+=%=
set statusline+=%#PmenuThumb#
set statusline+=\ %Y\ %{&fileencoding?&fileencoding:&encoding}\ 
set statusline+=\ %p%%\ %L\\%l\ :%c\ 

" --- switch buffer tabs --- "
nnoremap  <silent> <leader><tab>    :if &modifiable && !&readonly && &modified
      \ <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <leader><S-tab>  :if &modifiable && !&readonly && &modified
      \ <CR> :write<CR> :endif<CR>:bprevious<CR>
nnoremap <silent> - <C-^>

