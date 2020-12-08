" === vim settings === "
" use Tab to scroll, and Enter to select "
inoremap <expr><Tab>    pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><CR>     pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" set completeopt=menuone,noinsert,noselect
set shortmess+=c


" === ultisnips === "
" Trigger configuration. You need to change this to something other than <tab>
" let g:UltiSnipsExpandTrigger="<A-l>"
" let g:UltiSnipsJumpForwardTrigger="<A-j>"
" let g:UltiSnipsJumpBackwardTrigger="<A-k>"

" coc extentions "
let g:coc_global_extensions = [
        \ 'coc-marketplace',
        \ 'coc-html',
        \ 'coc-emmet',
        \ 'coc-css',
        \ 'coc-tailwindcss',
        \ 'coc-tsserver',
        \ 'coc-vetur',
        \ 'coc-eslint',
        \ 'coc-prettier',
        \ 'coc-snippets',
        \ 'coc-jedi',
        \ 'coc-phpls',
        \ 'coc-emoji',
        \ ]

" === Remaps === "

" Use <tab> for trigger completion with characters ahead and navigate. "
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin. "
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python "
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

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

" Use `[c` and `]c` to navigate diagnostics "
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap for rename current word "
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph "
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line "
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line "
nmap <leader>qf  <Plug>(coc-fix-current)

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
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Add status line support, for integration with other plugin, checkout `:h coc-status` "
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s). "
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder "
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" === Snippets === "

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
