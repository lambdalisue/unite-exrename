"******************************************************************************
"
" unite-exrename
"
" Add an Unite action to bluk rename files/directories
"
" Author:   Alisue <lambdalisue@hashnote.net>
" URL:      http://hashnote.net/
" License:  MIT license
" (C) 2014, Alisue, hashnote.net
"******************************************************************************
let s:save_cpo = &cpo
set cpo&vim


let s:exrename = {
      \ 'description' : 'bulk rename files',
      \ 'is_quit' : 1,
      \ 'is_invalidate_cache' : 1,
      \ 'is_selectable': 1,
      \}
function! s:exrename.func(candidates)
  let context = unite#get_context()
  let buffer_name = context.buffer_name
  if buffer_name ==# 'default'
    let buffer_name = 'unite'
  endif
  call unite#exrename#create_buffer(a:candidates, {
        \ 'buffer_name': buffer_name,
        \})
endfunction
call unite#custom#action('file_base', 'exrename', s:exrename)


let &cpo = s:save_cpo
unlet s:save_cpo
"vim: sts=2 sw=2 smarttab et ai textwidth=0 fdm=marker
