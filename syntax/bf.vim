if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'bf'
endif

syn match bfIncr "+"
syn match bfDecr "-"
syn match bfNext ">"
syn match bfPrev "<"
syn match Error "[[\]]"
syn region bfLoop1 matchgroup=bfLoop1 start=/\[/ end=/]/ contains=bfLoop2,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment
syn region bfLoop2 matchgroup=bfLoop2 start=/\[/ end=/]/ contains=bfLoop3,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment contained
syn region bfLoop3 matchgroup=bfLoop3 start=/\[/ end=/]/ contains=bfLoop4,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment contained
syn region bfLoop4 matchgroup=bfLoop4 start=/\[/ end=/]/ contains=bfLoop5,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment contained
syn region bfLoop5 matchgroup=bfLoop5 start=/\[/ end=/]/ contains=bfLoop6,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment contained
syn region bfLoop6 matchgroup=bfLoop6 start=/\[/ end=/]/ contains=bfLoop1,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment contained
syn match bfIO      "[.,]"
syn match bfComment "[^+\-<>[\].,]\+"

" hi def link bfIncr    PreProc
" hi def link bfDecr    PreCondit
" hi def link bfNext    Define
" hi def link bfPrev    Macro
" hi def link bfLoop    Repeat
" hi def link bfIO      String
hi def link bfComment Comment

hi bfIncr ctermfg=51 guifg=#00ffff
hi bfDecr ctermfg=226 guifg=#ffff00
hi bfNext ctermfg=24 guifg=#005f87
hi bfPrev ctermfg=64 guifg=#5f8700
hi bfLoop1 ctermfg=125 guifg=#af005f
hi bfLoop2 ctermfg=55 guifg=#5f00af
hi bfLoop3 ctermfg=25 guifg=#005faf
hi bfLoop4 ctermfg=35 guifg=#00af5f
hi bfLoop5 ctermfg=70 guifg=#5faf00
hi bfLoop6 ctermfg=130 guifg=#af5f00
hi bfIO ctermfg=213 guifg=#ff87ff

let b:current_syntax = 'bf'

if main_syntax == 'bf'
  unlet main_syntax
endif

