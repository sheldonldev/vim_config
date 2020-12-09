" load ~/.vimrc and ~/.vim "
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" disable python2 "
let g:loaded_python_provider = 0

" if you use virtual python3 environment "
let g:python3_host_prog = expand("/opt/anaconda3/envs/default/bin/python3")
" ^ example ^ "

" if you use virtual node environment "
"" let g:node_host_prog = expand("~/.nvm/versions/node/v12.16.1/bin/node")
" ^ example ^ "


" --- auto-install vim-plug --- "
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" --- integrated terminal --- "
tnoremap <Esc> <C-\><C-n>
nnoremap <A-v> :vsplit term://zsh<CR>
nnoremap <A-b> :split term://zsh <bar>resize 5<CR>


" --- disable some languages that already been well colorized --- "
" should call before plugin caller "
let g:polyglot_disabled = [
            \ 'markdown',
            \ ]

" ---- Complettion Settings ---"

" === vim settings === "
" use Tab to scroll, and Enter to select "
inoremap <expr><Tab>    pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><CR>     pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
filetype plugin on      " To use $NVIM_HOME/after/ftplugin
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set signcolumn=number
set updatetime=300      " Fast completion "
set timeoutlen=500      " Default is 1000 "

" === ALE ==="
" Note: should load before called
" Note: should turn off if use other completion source 
let g:ale_completion_enabled = 0
" Note: should turn on if use other LSP
let g:ale_disable_lsp = 1


" --- Call plugins ---- "
call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-gruvbox8'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'terryma/vim-multiple-cursors'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'

Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'tmd/vim-choosewin'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-fugitive'

Plug 'voldikss/vim-floaterm'

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
call plug#end()


" --- Plug Settings --- "

source ~/.config/nvim/defx.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/coc.vim

lua require'treesitter'

lua require'colorizer'
nnoremap <leader>c :ColorizerToggle<CR>
nnoremap <A-c> :ColorizerAttachToBuffer<CR>


" === gruvbox === "
set t_Co=256 
set termguicolors
set background=dark
colorscheme gruvbox8_hard


" === multiple-cursors === "
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" === vim-commentary === "
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>


" === airline === "
" enable tabline "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
set showtabline=2       " Always show tabs "
set noshowmode          " We don't need to see things like -- INSERT -- anymore "
nnoremap  <silent> <leader><tab>    :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <leader><S-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nnoremap  <silent> <A-q>      :bd<CR>


" === floaterm === "
let g:floaterm_complete_options = {'shortcut': 'floaterm', 'priority': 0, 'filter_length': [5, 20]}
nnoremap   <silent>   <F1>    :FloatermNew<CR>
tnoremap   <silent>   <F1>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F7>    :FloatermPrev<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

