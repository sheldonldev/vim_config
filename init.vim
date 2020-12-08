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
" let g:polyglot_disabled = [
"       \ 'markdown',
"       \ ]


" --- Call plugins ---- "
call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-gruvbox8'
Plug 'sheerun/vim-polyglot'

Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-fugitive'

Plug 'voldikss/vim-floaterm'

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

Plug 'terryma/vim-multiple-cursors'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
call plug#end()


" --- Plug Settings --- "

source ~/.config/nvim/defx.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/completion.vim

" lua require'treesitter'

lua require'colorizer'
nnoremap <leader>c :ColorizerToggle<CR>
nnoremap <A-c> :ColorizerAttachToBuffer<CR>


" === gruvbox === "
colorscheme gruvbox8_hard
set background=dark

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
