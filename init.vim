" load ~/.vimrc and ~/.vim "
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" plug config "
source ~/.config/nvim/coc.vim
source ~/.config/nvim/fzf.vim

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


" auto-install vim-plug "
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" disable some filetypes for polyglot "
let g:polyglot_disabled = [
            \'css',
            \'cs',
            \'markdown',
            \'reactjavascript',
            \'reacttypescript',
            \'php'
            \]

" Call plugins "
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'honza/vim-snippets'
Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()


" --- Plug Settings --- "

" === color scheme === "
colorscheme gruvbox
set background=dark


" === commentary === "
nnoremap <C-/> :Commentary<CR>
vnoremap <C-/> :Commentary<CR>


" === vim-snippets === "

" trigger snippet expand. "
imap <C-l> <Plug>(coc-snippets-expand)

" select text for visual placeholder of snippet. "
vmap <C-j> <Plug>(coc-snippets-select)

" jump to next placeholder, it's default of coc.nvim "
let g:coc_snippet_next = '<c-j>'

" jump to previous placeholder, it's default of coc.nvim "
let g:coc_snippet_prev = '<c-k>'

" expand and jump (make expand higher priority.) "
imap <C-j> <Plug>(coc-snippets-expand-jump)

" === nvim-treesitter ==== "
lua <<EOF
require 'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,        -- false will disable the whole extension
    disable = {},         -- list of language that will be disabled
  },
}
EOF
