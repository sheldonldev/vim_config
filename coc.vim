let g:coc_global_extensions = [
      \ 'coc-marketplace',
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-tailwindcss',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-eslint',
      \ 'coc-tslint',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-jedi',
      \ 'coc-java',
      \ ]


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
nmap <silent> gn <Plug>(coc-diagnostic-prev)
nmap <silent> gp <Plug>(coc-diagnostic-next)

" Remap for rename current word "
nmap <leader>rn <Plug>(coc-rename)

" Fix autofix problem of current line "
nmap <leader>qf  <Plug>(coc-fix-current)

" Format selected "
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Use `:Format` to format current buffer "
command! -nargs=0 Format    :call CocAction('format')
" Use `:Fold` to fold current buffer "
command! -nargs=? Fold      :call CocAction('fold', <f-args>)
" use `:Org` for organize import of current buffer "
command! -nargs=0 Org       :call CocAction('runCommand', 'editor.action.organizeImport')


" for scss "
autocmd FileType scss setl iskeyword+=@-@

" for prettier "
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add status line support, for integration with other plugin, checkout `:h coc-status` "
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
