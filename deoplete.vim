let g:deoplete#enable_at_startup = 1

" use Tab to scroll, and Enter to select "
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

nnoremap <silent>gd     <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent><C-]>  <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>K      <cmd>lua vim.lsp.buf.hover()<CR>


" === nvim-lspconfig === "
lua <<EOF
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.vuels.setup{}
EOF


" === ultisnips === "
" Trigger configuration. You need to change this to something other than <tab>
let g:UltiSnipsExpandTrigger="<A-l>"
let g:UltiSnipsJumpForwardTrigger="<A-j>"
let g:UltiSnipsJumpBackwardTrigger="<A-k>"
