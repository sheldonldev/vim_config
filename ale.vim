" === ALE === "

" global settings "
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_pattern_options = {
    \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
    \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
    \}

" automatic imports from external modules
let g:ale_completion_autoimport = 0

" lint on save and won't bother when changing
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

" Airline integration
let g:airline#extensions#ale#enabled = 1

" navigate between errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
