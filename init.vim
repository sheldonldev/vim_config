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


" --- Integrated Terminal --- "

" turn terminal to normal mode with escape "
tnoremap <Esc> <C-\><C-n>

" open terminal"
nnoremap <C-v> :vsplit term://zsh<CR>
nnoremap <C-b> :split term://zsh<bar> :resize 5<CR>


" --- auto-install vim-plug --- "
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" --- disable some languages that already been well colorized --- "
" should call before plugin caller "
let g:polyglot_disabled = [
  \ 'markdown',
  \ ]


" --- Call plugins ---- "
call plug#begin('~/.vim/plugged')
Plug 'sheldonldev/gruvbox'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'

""Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
""Plug 'kristijanhusak/defx-icons'
""Plug 'ryanoasis/vim-devicons'
""Plug 'kristijanhusak/defx-git'
Plug 'vim-airline/vim-airline'

Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'voldikss/vim-floaterm'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'

""Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim'
Plug 'honza/vim-snippets'
call plug#end()


" --- Plug Settings --- "

""source ~/.config/nvim/defx.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/fzf.vim

lua require'treesitter'


" === color scheme === "
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

" === commentary === "
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>


" === Emoji ==== "
augroup emoji_complete
  autocmd!
  autocmd FileType * setlocal completefunc=emoji#complete
augroup END


" === aire line === "

" enable tabline "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'

set showtabline=2       " Always show tabs "
set noshowmode          " We don't need to see things like -- INSERT -- anymore "


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


" === multi cursors === "

let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
