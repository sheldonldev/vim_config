" disable python2 "
let g:loaded_python_provider = 0

" if you use virtual python3 environment "
let g:python3_host_prog = expand("/usr/local/bin/python3")
" let g:python3_host_prog = expand("/opt/anaconda3/envs/default/bin/python3")

" if you use virtual node environment "
"" let g:node_host_prog = expand("~/.nvm/versions/node/v12.16.1/bin/node")


" --- integrated terminal --- "
tnoremap <Esc> <C-\><C-n>
nnoremap <A-v> :vsplit term://zsh<CR>
nnoremap <A-b> :split term://zsh <bar> resize 5<CR>


" --- load ~/.vimrc and ~/.vim --- "
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" --- Call plugins ---- "
" Note: if install slow in China, try switching
" to an accelorator such as 'https://github.com.cnpmjs.org' "

call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-colortemplate'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-buftabline'

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 't9md/vim-choosewin'

Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'

Plug 'neoclide/coc.nvim'
Plug 'honza/vim-snippets'
call plug#end()


" === buftabline === "
let g:buftabline_numbers = 1

" === colorizer === "
lua require'colorizer'
nnoremap <leader>c  :ColorizerToggle<CR>
nnoremap <leader>ca :ColorizerAttachToBuffer<CR>

" === vim-commentary === "
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>


" --- More Plugin Settings --- "
source ~/.config/nvim/plugconfig/defx.vim
source ~/.config/nvim/plugconfig/fzf.vim
source ~/.config/nvim/plugconfig/coc.vim

