" disable python2 "
let g:loaded_python_provider = 0

" python3 environment "
let g:python3_host_prog = expand("/usr/local/bin/python3")
" let g:python3_host_prog = expand("/opt/anaconda3/envs/default/bin/python3")


" --- integrated terminal --- "
tnoremap <Esc>  <C-\><C-n>
nnoremap jt     :vsplit term://zsh<CR>
nnoremap ht     :split term://zsh <bar> resize 5<CR>


" --- load ~/.vimrc and ~/.vim --- "
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" Colorizer: ------------------------------------- "
" lua require'colorizer'.setup{}
" nnoremap <leader>c  :ColorizerToggle<CR>
" nnoremap <leader>ca :ColorizerAttachToBuffer<CR>



