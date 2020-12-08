nnoremap <silent> <Leader>e
\ :<C-U>:Defx -show-ignored-files -resume -toggle -split=vertical -vertical_preview -winwidth=25<CR>
nnoremap <silent> <Leader>ef
  \ :<C-U>:Defx -show-ignored-files -resume -toggle -split=floating<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_tree', 'recursive:2') :
  \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> v
  \ defx#is_directory() ? 0 : defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> s
  \ defx#is_directory() ? 0 : defx#do_action('open', 'split')
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
  \ 'wincol':&columns / 6,
  \ 'winrow':&lines / 8,
  \ 'winwidth': &columns / 3 * 2,
  \ 'winheight': &lines / 4 * 3,
  \ 'toggle': 1,
  \ 'columns': 'mark:indent:git:icons:filename:type:size:space:time',
  \ })
