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


" --- More Plugin Settings --- "
source ~/.config/nvim/plugconfig/defx.vim

" === colorizer === "
nnoremap <leader>c  :ColorizerToggle<CR>
nnoremap <leader>ca :ColorizerAttachToBuffer<CR>



