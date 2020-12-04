nnoremap <silent> <Leader>e
  \ :<C-U>:Defx -show-ignored-files -resume -buffer_name=explorer -split=floating -vertical_preview<CR>

nnoremap <silent> -
  \ :<C-U>:Defx `expand('%:p:h')` -search=`expand('%:p')` -buffer-name=defx<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_tree', 'recursive:10') :
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> b
  \ defx#do_action('multi', ['close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree'])
  nnoremap <silent><buffer><expr> o
  \ match(bufname('%'), 'explorer') >= 0 ?
  \ (defx#is_directory() ? 0 : defx#do_action('drop', 'vsplit')) :
  \ (defx#is_directory() ? 0 : defx#do_action('multi', ['open', 'quit']))
  nnoremap <silent><buffer><expr> l
  \ defx#is_directory() ? defx#do_action('open') : 0
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> A
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> a
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
endfunction

call defx#custom#option('_', {
\ 'winwidth': 80,
\ 'winheight': 80,
\ 'ignored_files': '.*,target*',
\ 'direction': 'topleft',
\ 'toggle': 1,
\ 'columns': 'mark:git:indent:icons:filename:type',
\ })
