function! myspacevim#before() abort
  call ConfigureYcm()
  call FormatOnSave()
  autocmd FileType denite call DeniteMyKeymap()
  "autocmd FileType denite-filter call DeniteMyFilterKeymap()
  "call SpaceVim#custom#SPC('nore', ['f', 'p'], 'call FindFileInGitRepository()', 'Find file in git repository', 1)
endfunction

"call SpaceVim#custom#SPC('nore', ['G', 't'], 'echom 1', 'echomessage 1', 1)
"function! SpaceVim#custom#SPC(m, keys, cmd, desc, is_cmd) abort

function! myspacevim#after() abort
endfunction

function! ConfigureYcm() abort
  let g:spacevim_enable_ycm = 1
  let g:spacevim_autocomplete_method = "ycm"
  let g:ycm_clangd_binary_path = "clangd"
  let g:ycm_use_clangd = 1
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
"
function! DeniteMyKeymap() abort
  nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select').'j'
endfunction

function! DeniteMyFilterKeymap() abort
  map <silent><buffer> <PageUp>
	  \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
  map <silent><buffer> <PageDown>
    \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
endfunction
