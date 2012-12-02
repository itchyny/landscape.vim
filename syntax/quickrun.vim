syntax match Error '^.*[Ee]rror.*'
syntax match Error '^.*[Ww]arning.*'
syntax match Error '^.*ERROR.*'
syntax match Error '^.*WARNING.*'
syntax match Error '^.*I found no.*'
syntax match Error "^.*I can't.*"
syntax match Error '^.*Overfull.*'
syntax match Error '^!.*'
syntax match quickrunPath '\(\/\|\.\.\?\)\(\([[:alpha:]_.][[:alnum:]_.-]*\)\/\)\+\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\|.\)\?'
syntax match quickrunPath '[[:alnum:]]\@<!\.\?\/\([a-z][[:alnum:]_-]*\)\.\([a-z]*[[:alnum:]_-]\+\)'
syntax match quickrunImage '<\@<=[[:alnum:]]\@<!\.\?\/\?\([a-z][[:alnum:]_-]*\)\.\([a-z]*[[:alnum:]_-]\+\)>\@='
highlight default link quickrunPath Constant
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

