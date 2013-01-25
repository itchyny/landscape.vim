if version < 700
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax keyword Error Error ERROR error warning Warning WARNING Overfull
syntax match Error '^!.*'
syntax match quickrunPath '\(^\|\s\)\(\(\.\|\~\)\?\|\.\.\?\)\(\/\([[:alnum:]_.][[:alnum:]_.-]\+\)\)\+\/\?'
syntax match quickrunPath '\(\(\.\|\~\)\?\/\|\.\.\?\)\(\([[:alpha:]_.][[:alnum:]_.-]*\)\/\)\+\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\|.\)\?'
syntax match quickrunPath '[[:alnum:]]\@<!\.\?\/\([a-z][[:alnum:]_-]*\)\.\([a-z]*[[:alnum:]_-]\+\)'
syntax match quickrunPath '\(^\|\s\)\(\(\.\|\~\)\?\/\|\.\.\?\)\?\(\([[:alnum:]_.][[:alnum:]_.-]*\)\/\)\+\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\|.\)\?'
syntax match quickrunPath '\(\/\|\.\.\?\)\(\([[:alpha:]_.][[:alnum:]_.-]*\)\/\)\+\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\|.\)\?'
syntax match quickrunImage '<\@<=[[:alnum:]]\@<!\.\?\/\?\([a-z][[:alnum:]_-]*\)\.\([a-z]*[[:alnum:]_-]\+\)>\@='
syntax match quickrunStringSpecial '\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)'
      \ contains=quickrunFunction contained
syntax region quickrunString start=+"+ end=+"+ contains=quickrunStringSpecial oneline
syntax region quickrunString start=+'+ end=+'+ contains=quickrunStringSpecial oneline
syntax region quickrunString start=+`+ end=+`+ contains=quickrunStringSpecial oneline
highlight default link quickrunStringSpecial SpecialChar
highlight default link quickrunString String
highlight default link quickrunPath Preproc
highlight default link quickrunImage Type
highlight default link quickrunNumber Number
highlight default link quickrunFloat Float
syntax match quickrunNumber '[+-]\=\<\d\+\>\|[+-]\=\<0[xX]\x\+\>\|[+-]\=\<0[oO]\o\+\>'
syntax match quickrunFloat '\<[+-]\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\?'
syntax match quickrunTime '\<\d\d\=:\d\d\=\>'
syntax match quickrunTime '\<\d\d\=:\d\d\=:\d\d\=\>'
syntax match quickrunDate '\<\d\+-\d\d\=-\d\+\>'
syntax match quickrunDate '\<\d\+/\d\d\=/\d\+\>'
highlight default link quickrunTime Time
highlight default link quickrunDate Date
let b:current_syntax = 'quickrun'

