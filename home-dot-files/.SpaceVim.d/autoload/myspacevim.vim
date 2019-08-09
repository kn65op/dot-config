function! myspacevim#before() abort
  call ConfigureYcm()
  call FormatOnSave()
endfunction

function! myspacevim#after() abort
endfunction

function! ConfigureYcm() abort
  let g:spacevim_enable_ycm = 1
  let g:spacevim_autocomplete_method = "ycm"
endfunction

function! FormatOnSave() abort
  augroup fmt
     autocmd!
     autocmd BufWritePre * undojoin | Neoformat
   augroup END
endfunction
