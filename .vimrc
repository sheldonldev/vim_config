syntax on                       " let vim overrule your settings with default syntax 
syntax enable                   " if you have $VIM_HOME/syntax/syntax.vim 
filetype indent plugin on       " To use $VIM_HOME/after/ftplugin
set nocompatible                " no compatible with vi or other vim

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
set cursorcolumn        " highlight the colum where the cursor is there "
set cursorline          " highlight the line where the cursor is there "

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
set smartindent         " try best job to indent for you, often work together with autoindent "
set preserveindent      " preserve as much of the indent structure as possible when changing indent "

set noswapfile                  " no need swap because we use undodir "
set nobackup                    " no need backup either "
set undodir=~/.vim/undodir      " for save undo files "
set undofile                    " an undo file per file "

set incsearch                   " get result while entering "
set hlsearch                    " highlight searches "
set ignorecase                  " case ignore search "
set smartcase                   " case sensitive if Capital is typed in "

set clipboard=unnamed           " use register without name. Note: use `unnamedplus` if not macOS "

set iskeyword+=-        " treat dash separated words as one word text object"
set iskeyword+=@        " similar as above "

" Search: ----------------------------------- "
set path+=**  " search down for subfolders provides tab-completion for all file related tasks "
set wildignore+=**/node_modules/**  " ignore node_modules "
set wildmenu  " Now you can us search commands such as :find :b :h with Tab incompletion and Enter the match"

" Cursor: ------------------------------------ "
" blinking cursor "
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

" cursor shape in different mode "
" Note: checkout solutions here: https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modesi
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Keybindings: ------------------------------- "
set timeoutlen=500
let mapleader = " "

" Netrw: ----------------------------------------- "
let g:NetrwIsOpen = 1
function! ToggleNetrw()
  if g:NetrwIsOpen
    let i = bufnr("$")
    while (i >= 1) 
      if (getbufvar(i, "&filetype") == "netrw")
        silent exe "bwipeout" . i
      endif
      let i -= 1
    endwhile
    let g:NetrwIsOpen = 0
  else
    let g:NetrwIsOpen = 1
    silent Lexplore
  endif
endfunction

function! NetrwMappings()
  noremap <silent>  <leader>e  :call ToggleNetrw()<CR>
endfunction

let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_preview = 1
let g:netrw_alto = 1

augroup netrw
  autocmd!
  autocmd CursorHold * if (&filetype == 'netrw' && &number == 0) | 
        \ setl nu relativenumber statusline=%#StatusLineNC#\ netrw | 
        \ endif
  autocmd filetype netrw call NetrwMappings()

  " open netrw when enter vim "
	autocmd VimEnter * if expand("%") == "" | e . | endif
  " Note: 
  " In vim, manually press any key to toggle line number in explorer
  " Use `p` will keep only one window open.
  " Use `<space>e` to toggle netrw whenever you want.
augroup END

" Windows: ----------------------------------------- "
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

" AutoPair: ---------------------------------------- "
inoremap () ()<Esc>ha
inoremap <> <><Esc>ha
inoremap '' ''<Esc>ha
inoremap "" ""<Esc>ha
inoremap `` ``<Esc>ha
inoremap [] []<Esc>ha
inoremap {} {}<Esc>ha
inoremap {{ {{<space><space>}}<Esc>F<space>i
inoremap {% {%<space><space>%}<Esc>F<space>i

" SmoothScroll: ----------------------------------- "
nnoremap <silent> <C-d>   Lzz
nnoremap <silent> <C-u>   Hzz
nnoremap <silent> G       Gzz

" Formmat: ----------------------------------------- "
nnoremap <silent> <leader>i       mngg=G`nzz

fun! TrimWhite()
  let l:save = winsaveview()
  keeppatterns %s/\s\s\+$//e
  keeppatterns %s/\n\{3,}/\r\r\r/e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhite()

" QuitAndSave: ------------------------------------- "
nnoremap <silent> <leader>q   :q<CR>
nnoremap <silent> <leader>Q   :bd<CR>
nnoremap <silent> <leader>s   :wa<CR>
nnoremap <silent> <C-c>       <C-c> <bar> <Esc>

" Terminal: ---------------------------------------- "
if !has('nvim')
  nnoremap <silent> <leader>vt  :vert term<CR>
  tnoremap <silent> <Esc>       <C-\><C-n>
endif

" Statusline: -------------------------------------- "
function! GitBranch()
  return system("git rev-parse --abbrev-ref @ 2>/dev/null | tr -d '\n'")
endfunction
function! GitStatus()
  return system("[[ -n \"$(git status --porcelain " . shellescape(expand("%")) . ")\" ]] && echo -n +")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  let l:gitstatus = GitStatus()
  return strlen(l:branchname) > 0 ? ' '.l:branchname.' '.l:gitstatus : ''
endfunction

set statusline=
set statusline+=%#PmenuThumb#
set statusline+=\ %{StatuslineGit()}\ 
set statusline+=%#StatusLine#
set statusline+=
set statusline+=\ %f\ %m\ %R\ 
set statusline+=%=
set statusline+=%#PmenuThumb#
set statusline+=\ %Y\ %{&fileencoding?&fileencoding:&encoding}\ 
set statusline+=\ %p%%\ %L\\%l\ :%c\ 

" BufTabSwitch: ---------------------------------- "
nnoremap  <silent> <leader><Tab>    :bnext<CR> 
nnoremap  <silent> <leader><S-Tab>  :bprevious<CR>
nnoremap  <silent> <Tab>            <C-^>

" PlugCaller: ------------------------------------ "
" Note: if install slow in China, try switching
" to an accelorator such as 'https://github.com.cnpmjs.org' "

call plug#begin('~/.vim/plugged')
if !has('nvim')
  Plug 'sheldonldev/vim-gruvdark'
  Plug 'sheerun/vim-polyglot'
  Plug 'ap/vim-buftabline'

  Plug 'rrethy/vim-hexokinase'
  Plug 'tpope/vim-commentary'

  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'airblade/vim-rooter'

  Plug 'neoclide/coc.nvim'
  Plug 'honza/vim-snippets'
else
  Plug 'lifepillar/vim-colortemplate'
  Plug 'sheldonldev/vim-gruvdark'
  Plug 'sheerun/vim-polyglot'
  Plug 'ap/vim-buftabline'

  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'tpope/vim-commentary'

  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'airblade/vim-rooter'

  Plug 'neoclide/coc.nvim'
  Plug 'honza/vim-snippets'
endif
call plug#end()


" ColorScheme: ------------------------------------- "
set t_Co=256
set termguicolors
set background=dark
colorscheme gruvdark


" SmallPlugins: ------------------------------------ "

" === buftabline === "
let g:buftabline_numbers = 1

" === vim-commentary === "
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" === hexokinase === "
if !has('nvim')
  let g:Hexokinase_highlighters = ['foregroundfull']
  let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'
  nnoremap <leader>c :HexokinaseToggle
endif


" CompletionSettings: ----------------------------- "
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set signcolumn=number
set updatetime=100        " Fast completion "

" use Tab to scroll, and Enter to select "
inoremap <expr><Tab>    pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><CR>     pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Plugins: --------------------------------------- "
source ~/.config/nvim/plugconfig/coc.vim
source ~/.config/nvim/plugconfig/fzf.vim
