" Vim syntax file
" Language: Holiday plan

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn region DayRoute start=": " end="\n" fold transparent contains=Route,Details,Place,Hour

syn match Date '\d\d\.\d\d' contained
syn match Route '-[0-9h:\[\]]*h*>'
syn match Details '([^()]*)' contained contains=Hour
syn match Place '[^()->]\+' contained nextgroup=Hour
syn match Hour '\d\{1,2}:\d\d' contained
syn match Hour '\d\{1,2}:\d\dh' contained

syn keyword Day pon wto śro czw pią sob nie nextgroup=Date skipwhite

hi def link Day Constant
hi def link Date Constant
hi def link Route Statement
hi def link Details PreProc 
hi def link Place Type
hi def link Hour Comment

let b:current_syntax = "hplan"

set wrap
