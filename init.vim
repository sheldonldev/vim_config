" load ~/.vimrc and ~/.vim"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" disable python2 "
let g:loaded_python_provider = 0


" --- Integrated Terminal --- "

" open new split panes to right and below "
set splitright
set splitbelow

" turn terminal to normal mode with escape "
tnoremap <Esc> <C-\><C-n>

" open terminal "
function! OpenTerminal()
    split term://zsh
    resize 5
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>


" --- Plugins --- "

" disable some color for polyglot "
let g:polyglot_disabled = []
"            \'css',
"            \'cs',
"            \'markdown',
"            \'reactjavascript',
"            \'reacttypescript',
"            \'php'
"            \]

" coc extentions "
let g:coc_global_extensions = [
            \ 'coc-emmet',
            \ 'coc-css',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-prettier',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-python',
            \ 'coc-yaml',
            \ 'coc-pairs',
            \ 'coc-eslint',
            \ 'coc-stylelint',
            \ 'coc-snippets',
            \ 'coc-highlight',
            \ 'coc-phpls',
            \ 'coc-wxml',
            \ 'coc-java',
            \ 'coc-omnisharp',
            \ 'coc-angular'
            \ ]

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}

Plug 'sheerun/vim-polyglot'

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()


" --- Plug Settings --- "


" === color scheme === "
colorscheme gruvbox
set background=dark


" === relative number === "
set number relativenumber


" === NERDTree === "
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open "
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle "
nnoremap <silent> <leader>e :NERDTreeToggle<CR>


" === fzf === "

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Ignore node_moduales "
" requires silversearcher-ag "
let $FZF_DEFAULT_COMMAND = 'ag -g ""'



" === coc === "

" for scss extention "
autocmd FileType scss setl iskeyword+=@-@

" for prettier extention "
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Prettier range format only support languageId including: "
" javascript, javascriptreact, typescript, typescriptreact, json and graphql. "

" for vetur extention "
" tell :CocConfig where is the `.eslintrc.json`"
" {
"   'eslint.options': { 'configFile': 'mydirectory/.eslintrc.json' }
" }

" for python extention "
set statusline^=%{coc#status()}
" if you need lint: `pip3 install pylint`"
" run `:Python` to see all available settings, then run commands in :CocCommand "



" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <A-a>  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <A-e>  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <A-c>  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <A-o>  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <A-s>  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <A-j>  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <A-k>  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <A-p>  :<C-u>CocListResume<CR>

