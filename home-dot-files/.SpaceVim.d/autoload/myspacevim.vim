function! myspacevim#before() abort
  call SetLinesMargin()
  call RemoveJKMappingToEsc()
  "call ConfigureYcm()
  call FormatOnSave()
  autocmd FileType denite call DeniteMyKeymap()
  "autocmd FileType denite-filter call DeniteMyFilterKeymap()
  "call SpaceVim#custom#SPC('nore', ['f', 'p'], 'call FindFileInGitRepository()', 'Find file in git repository', 1)
  "nnoremap <silent> <C-p> :call <SID>warp_denite('Denite file/rec/git')<cr>
  call SetFGFindInGit()
  "call DisableQuickFix()
endfunction

"call SpaceVim#custom#SPC('nore', ['G', 't'], 'echom 1', 'echomessage 1', 1)
"function! SpaceVim#custom#SPC(m, keys, cmd, desc, is_cmd) abort

function! myspacevim#after() abort
endfunction

function! RemoveJKMappingToEsc() abort
  iunmap jk
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

function! SetLinesMargin() abort
  set scrolloff=10
endfunction

function! SetFGFindInGit() abort
  call SpaceVim#custom#SPC('nore', ['p', 'g'], 'call call('
        \ . string(s:_function('s:warp_denite')) . ', ["Denite file/rec/git"])',
        \ ['find files in current git project',
        \ [
        \ '[SPC p g] is to find files added to git in the root of the current project',
        \ '',
        \ 'Definition: ' . s:filename . ':' . lnum,
        \ ]
        \ ],
        \ 1)
endfunction

function! DisableQuickFix() abort
  let g:prettier#quickfix_enabled = 0
  let g:ale_set_quickfix = 0
  let g:ale_set_loclist = 0
endfunction
