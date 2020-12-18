let g:coc_global_extensions = [
      \ 'coc-emoji',
      \ 'coc-marketplace',
      \ 'coc-json',
      \ 'coc-tailwindcss',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-react-refactor',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-jedi',
      \ ]

" === Explorer === "
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
nmap <leader>e :CocCommand explorer<CR>

" Explorer preset "
let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\     'floating-width': -50
\   },
\ }

" Use preset argument to open it "
nmap <leader>ef :CocCommand explorer --preset floating<CR>
nmap <leader>ev :CocCommand explorer --preset floating ~/.config/nvim<CR>
nmap <leader>ed :CocCommand explorer --preset floating ~/Documents/hub/doc<CR>

" List all presets "
nmap <leader>el :CocList explPresets

" API "
function! s:enter_explorer()
  if &filetype == 'coc-explorer'
    setl nu relativenumber
    setl statusline=coc-explorer
  endif
endfunction
augroup CocExplorerCustom
  autocmd!
  autocmd BufEnter * call <SID>enter_explorer()
augroup END


" Remap: "
" Remap keys for gotos "
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window "
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" navigate diagnostics "
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Remap for rename current word "
nmap <leader>rn <Plug>(coc-rename)

" Code action "
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" for scss "
autocmd FileType scss setl iskeyword+=@-@

" Prettier:"
" prettier-eslint and prettier-tslint are included with the installation of this extension.
" eslint, tslint, and all peer dependencies required by your specific configuration
" must be installed locally.


" Add status line support, for integration with other plugin, checkout `:h coc-status` "
set statusline+=%#StatusLineNC#
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
