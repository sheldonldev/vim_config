" load ~/.vimrc and ~/.vim "
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" disable python2 "
let g:loaded_python_provider = 0

" if you use virtual python3 environment "
"" let g:python3_host_prog = expand("<path to python with pynvim installed>")
" ^ example ^ "

" if you use virtual node environment "
"" let g:node_host_prog = expand("~/.nvm/versions/node/v12.16.1/bin/node")
" ^ example ^ "


" --- Integrated Terminal --- "

" turn terminal to normal mode with escape "
tnoremap <Esc> <C-\><C-n>

" open terminal "
function! OpenTerminal()
  split term://zsh
  resize 5
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>


" --- auto-install vim-plug --- "
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" --- disable some languages that already been well colorized --- "
" should call before plugin caller "
let g:polyglot_disabled = [
  \ 'markdown',
  \ 'html',
  \ 'css',
  \ 'java',
  \ 'c/c++',
  \ 'php',
  \ 'python',
  \ ]


" --- Call plugins ---- "
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
call plug#end()


" --- Plug Settings --- "

source ~/.config/nvim/coc.vim
source ~/.config/nvim/fzf.vim

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

" === Enable all moduals in treesitter === "
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,        -- false will disable the whole extension
    disable = {},         -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },
  textobjects = { enable = true },
}
EOF
