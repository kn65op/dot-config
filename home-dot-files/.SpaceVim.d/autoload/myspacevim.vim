function! myspacevim#before() abort
  call ConfigureYcm()
  call FormatOnSave()
  "call SpaceVim#custom#SPC('nore', ['f', 'p'], 'call FindFileInGitRepository()', 'Find file in git repository', 1)
endfunction

"call SpaceVim#custom#SPC('nore', ['G', 't'], 'echom 1', 'echomessage 1', 1)
"function! SpaceVim#custom#SPC(m, keys, cmd, desc, is_cmd) abort
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

"function! FindFileInGitRepository() abort
  "echo "FIND func:"
"endfunction
