" Vim syntax file
" Language: Holiday pack list

if exists("b:current_syntax")
  finish
endif

syn match Category '^[^[].*$'

syn match Legend '^-.*$'
syn match NotPackedItem '^\[ \].*$'
syn match ItemInMainLuggage '^\[w\].*$'
syn match ItemInPersonalLuggage '^\[p\].*$'
syn match ItemToWear '^\[u\].*$'
syn match ItemInSmallCameraBackpack '^\[a\].*$'
syn match ItemInBigCameraBackpack '^\[A\].*$'
syn match ItemInVanityCase '^\[k\].*$'
syn match VirtualItemInPhone '^\[t\].*$'
syn match UnknownStateItem '^\[[^twpuaAk ]\+\].*$'
syn match UnknownStateItemWithSlash '^\[...*\].*$'

hi PackedInMain ctermfg=Green guifg=Green
hi PackedInMainInside ctermfg=Green guifg=Green gui=underline cterm=underline
hi PackedInPersonal ctermfg=LightGreen guifg=LightGreen
hi PackedInPersonalInside ctermfg=LightGreen guifg=LightGreen gui=underline cterm=underline
hi StoredInPhone ctermfg=Green guifg=Green gui=italic cterm=italic
hi UnknownItem ctermfg=Yellow guifg=Yellow gui=bold cterm=bold

hi def link Category Title
hi def link Legend Comment

hi def link NotPackedItem Error
hi def link ItemInMainLuggage PackedInMain
hi def link ItemInBigCameraBackpack PackedInMainInside
hi def link ItemInPersonalLuggage PackedInPersonal
hi def link ItemInSmallCameraBackpack PackedInPersonalInside
hi def link ItemInVanityCase PackedInMainInside
hi def link ItemToWear QuickFixLine 
hi def link VirtualItemInPhone StoredInPhone
hi def link UnknownStateItem UnknownItem
hi def link UnknownStateItemWithSlash UnknownItem

let b:current_syntax = "hpack"


set wrap
