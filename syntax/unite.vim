if version < 700
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syntax match uniteSourcePrompt /^Sources/ contained nextgroup=uniteSeparator
syntax match uniteSeparator /:/ contained nextgroup=uniteSourceNames
syntax match uniteSourceNames / [[:alnum:]_\/-]\+/ contained nextgroup=uniteSourceArgs
syntax match uniteMessageSource /^\[.\{-}\]/ contained
syntax match uniteSourceArgs /:\S\+/ contained

" syntax match uniteFile '.*\(\.[[:alnum:]]\+\|/\)\(\s\s\s\)\@=' contained containedin=uniteCandidateAbbr
syntax match uniteFile '.*\.[[:alnum:]]\+\(\s\s\s\)\@=' contained containedin=uniteCandidateAbbr
" syntax match uniteDotFiles '[/\s]\@<=\.[[:alnum:]_.-]\+\s\{10,}' contained containedin=uniteFile
" highlight default link uniteDotFiles Comment
" syntax match unitePath '.*/' contained containedin=uniteFile
" highlight default link unitePath Preproc
syntax match unitePdf '.*\.\(pdf\|html\|HTML\)\>' contained containedin=uniteFile
highlight default link unitePdf Function
syntax match uniteArchive '.*\.\(lha\|lzh\|zip\|gz\|bz2\|cab\|rar\|7z\|tgz\|tar\)\>' contained containedin=uniteFile
highlight default link uniteArchive Special
syntax match uniteImage '.*\.\(eps\|EPS\|bmp\|BMP\|png\|PNG\|gif\|GIF\|JPE\?G\|jpe\?g\|jp2\|tif\|ico\|wdp\|cur\|ani\)\>' contained containedin=uniteFile
highlight default link uniteImage Type
syntax match unitePdf '[^/]*\.pdf' contained containedin=uniteFile
highlight default link unitePdf Function
syntax match uniteTypeMultimedia '.*\.\(
      \.avi\|asf\|wmv\|mpg\|flv\|swf\|divx\|mov\|mpa\|m1a\|
      \.m2p\|m2a\|mpeg\|m1v\|m2v\|mp2v\|mp4\|qt\|ra\|rm\|ram\|
      \.rmvb\|rpm\|smi\|mkv\|mid\|wav\|mp3\|ogg\|wma\|au\)\>' contained containedin=uniteFile
highlight default link uniteTypeMultimedia Identifier
syntax match uniteTypeSystem '.*\.\(o\|hi\|inf\|sys\|reg\|dat\|spi\|a\|so\|lib\|dll\)\>' contained containedin=uniteFile
syntax match uniteTypeSystem '\(Makefile\.in\|configure[\s$]\|aclocal\.m4\|Makefile\|stamp-h1\|config\.status\|config\.h\(\.in\)\?\~\?\|config\.h\.in\~\?\|output\.[0-9]\S\?\|requests\|traces\.[0-9]\S\?\)\s\@=' contained containedin=uniteFile
highlight default link uniteTypeSystem Comment
syntax region uniteMarkedLine start=/^\*/ end='$' keepend
syntax region uniteNonMarkedLine start=/^- / end='$' keepend
      \ contains=uniteCandidateMarker,uniteCandidateSourceName,uniteCandidateAbbr
syntax match uniteCandidateMarker /^- / contained
syntax match uniteQuickMatchTrigger /^.|/ contained
syntax match uniteNumber '\d\+' contained containedin=uniteStatusLine
highlight default link uniteNumber Number

highlight default link uniteSourcePrompt Constant
highlight default link uniteSeparator NONE
highlight default link uniteSourceNames Constant
highlight default link uniteSourceArgs Function
highlight default link uniteMessageSource Constant

highlight default link uniteQuickMatchTrigger Special
highlight default link uniteMarkedLine Statement
highlight default link uniteCandidateSourceName uniteSourceNames
highlight default link uniteCandidateMarker Special
highlight default link uniteCandidateInputKeyword Define

highlight default link uniteChooseAction NONE
highlight default link uniteChooseCandidate NONE
highlight default link uniteChooseKey SpecialKey
highlight default link uniteChooseMessage NONE
highlight default link uniteChoosePrompt uniteSourcePrompt
highlight default link uniteChooseSource uniteSourceNames
highlight default link uniteSource__FileMru_Time Date

syntax region uniteError start=+!!!+ end=+!!!+ contains=uniteErrorHidden oneline
if has('conceal')
  " Supported conceal features.
  syntax match uniteErrorHidden '!!!' contained conceal
else
  syntax match uniteErrorHidden '!!!' contained
endif

highlight default link uniteInputPrompt Identifier
highlight default link uniteInputPromptError Error
highlight default link uniteInputSpecial Special

highlight default link uniteError Error
highlight default link uniteErrorHidden Ignore

let b:current_syntax = 'unite'

