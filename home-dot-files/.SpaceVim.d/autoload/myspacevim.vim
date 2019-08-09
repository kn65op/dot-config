function! myspacevim#before() abort
  let g:spacevim_enable_ycm = 1
  let g:spacevim_autocomplete_method = "ycm"
  augroup fmt
     autocmd!
     autocmd BufWritePre * undojoin | Neoformat
   augroup END
endfunction

function! myspacevim#after() abort
endfunction
