if version < 700
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax match bfIncr "+"
syntax match bfDecr "-"
syntax match bfNext ">"
syntax match bfPrev "<"
syntax match Error "[[\]]"
syntax region bfLoop1 matchgroup=bfLoop1 start=/\[/ end=/]/ contains=bfLoop2,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment
syntax region bfLoop2 matchgroup=bfLoop2 start=/\[/ end=/]/ contains=bfLoop3,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment contained
syntax region bfLoop3 matchgroup=bfLoop3 start=/\[/ end=/]/ contains=bfLoop4,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment contained
syntax region bfLoop4 matchgroup=bfLoop4 start=/\[/ end=/]/ contains=bfLoop5,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment contained
syntax region bfLoop5 matchgroup=bfLoop5 start=/\[/ end=/]/ contains=bfLoop6,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment contained
syntax region bfLoop6 matchgroup=bfLoop6 start=/\[/ end=/]/ contains=bfLoop1,bfIncr,bfDecr,bfNext,bfPrev,bfIO,bfComment contained
syntax match bfIO      "[.,]"
syntax match bfComment "[^+\-<>[\].,]\+"

" highlight default link bfIncr    PreProc
" highlight default link bfDecr    PreCondit
" highlight default link bfNext    Define
" highlight default link bfPrev    Macro
" highlight default link bfLoop    Repeat
" highlight default link bfIO      String
highlight default link bfComment Comment

highlight bfIncr ctermfg=51 guifg=#00ffff
highlight bfDecr ctermfg=226 guifg=#ffff00
highlight bfNext ctermfg=24 guifg=#005f87
highlight bfPrev ctermfg=64 guifg=#5f8700
highlight bfLoop1 ctermfg=125 guifg=#af005f
highlight bfLoop2 ctermfg=55 guifg=#5f00af
highlight bfLoop3 ctermfg=25 guifg=#005faf
highlight bfLoop4 ctermfg=35 guifg=#00af5f
highlight bfLoop5 ctermfg=70 guifg=#5faf00
highlight bfLoop6 ctermfg=130 guifg=#af5f00
highlight bfIO ctermfg=213 guifg=#ff87ff

let b:current_syntax = 'bf'

