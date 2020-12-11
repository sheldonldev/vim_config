call defx#custom#column('git', 'show_ignored', 1)

nnoremap <silent> <Leader>e
      \ :<C-U>:Defx -show-ignored-files -buffer-name=defx<CR>
nnoremap <silent> <Leader>ef
      \ :<C-U>:Defx -show-ignored-files -resume -toggle -split=floating -bufname=defx<CR>

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ defx#is_directory() ?
        \ defx#do_action('open_tree', 'recursive:1') :
        \ defx#do_action('open',['choose'])
  nnoremap <silent><buffer><expr> v
        \ match(bufname('%'), 'defx') >= 0 ?
        \ (defx#is_directory() ? 0 : defx#do_action('drop', 'vsplit')) :
        \ (defx#is_directory() ? 0 : defx#do_action('multi', ['open', 'quit']))
  nnoremap <silent><buffer><expr> o
        \ defx#is_directory() ? 0 : defx#do_action('multi', ['open', 'quit'])
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
      \ 'resume': 1,
      \ 'columns': 'indent:git:icons:filename:size:mark:type:time',
      \ })
