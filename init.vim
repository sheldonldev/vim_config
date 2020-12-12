" --- nvim ---"
" load ~/.vimrc and ~/.vim "
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

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

" ---- Complettion Settings ---"
" use Tab to scroll, and Enter to select "
inoremap <expr><Tab>    pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><CR>     pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
filetype indent plugin on      " To use $NVIM_HOME/after/ftplugin
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set signcolumn=number
set updatetime=0        " Fast completion "

" --- Call plugins ---- "
" Note: if install slow in China, try switching
" to an accelorator such as 'https://github.com.cnpmjs.org' "
call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-gruvbox8'
Plug 'ap/vim-buftabline'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-commentary'

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 't9md/vim-choosewin'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'

Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim'
Plug 'honza/vim-snippets'
call plug#end()

" --- Plug Settings --- "

source ~/.config/nvim/defx.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/coc.vim

" === gruvbox === "
set termguicolors
set background=dark
colorscheme gruvbox8_hard

" === buftabline === "
let g:buftabline_numbers = 1

" === colorizer === "
lua require'colorizer'
nnoremap <leader>c  :ColorizerToggle<CR>
nnoremap <leader>ca :ColorizerAttachToBuffer<CR>

" === vim-commentary === "
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>



