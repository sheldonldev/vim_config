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
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'

Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
call plug#end()


" --- Plug Settings --- "

source ~/.config/nvim/coc.vim
source ~/.config/nvim/fzf.vim

lua require'treesitter'


" === color scheme === "
colorscheme gruvbox
set background=dark


" === commentary === "
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>


" === aire line === "

" enable tabline "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'

set showtabline=2       " Always show tabs "
set noshowmode          " We don't need to see things like -- INSERT -- anymore "

