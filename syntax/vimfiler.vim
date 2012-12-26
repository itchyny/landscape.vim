
let leaf_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_leaf_icon)
let opened_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_opened_icon)
let closed_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_closed_icon)
let file_icon = vimfiler#util#escape_pattern(g:vimfiler_file_icon)
let marked_file_icon = vimfiler#util#escape_pattern(g:vimfiler_marked_file_icon)

syntax match vimfilerNonMarkedFile '.*'
 \ contains=vimfilerNonMark,vimfilerTypeText,vimfilerTypeImage,vimfilerTypeArchive,
 \vimfilerTypeExecute,vimfilerTypeMultimedia,vimfilerTypeDirectory,vimfilerTypeSystem,vimfilerTypeLink,
 \vimfilerSize,vimfilerDate,vimfilerDateToday,vimfilerDateWeek
execute 'syntax match vimfilerMarkedFile' '''^\s*\%(' . leaf_icon .'\)\?'
 \ . marked_file_icon . ' .*$'''
 \ 'contains=vimfilerDate,vimfilerDateToday,vimfilerDateWeek'
syntax match vimfilerDirectory '^..$'

syntax match vimfilerPrompt '^\[in\]: .*$' contains=vimfilerSpecial,vimfilerCurrentDirectory
syntax match vimfilerPromptUnSafe '^! \[in\]: .*$' contains=vimfilerSpecial,vimfilerSpecialUnSafe,vimfilerCurrentDirectory
syntax match vimfilerSpecialUnSafe '^! ' contained
syntax match vimfilerSpecial '\[in\]:' contained
syntax match vimfilerCurrentDirectory '\s\zs.*$' contained contains=vimfilerMask
syntax match vimfilerMask '\[.*\]$' contained
syntax match vimfilerFileLine '\[.*\]$' contained

syntax match vimfilerTypeText '.*\[TXT\]' contained
syntax match vimfilerTypeImage '.*\[IMG\]' contained
syntax match vimfilerTypeArchive '.*\[ARC\]' contained
syntax match vimfilerTypeExecute '.*\[EXE\]' contained
syntax match vimfilerTypeMultimedia '.*\[MUL\]' contained
syntax match vimfilerTypeDirectory '.*\[DIR\]' contained
syntax match vimfilerTypeSystem '.*\[SYS\]' contained
syntax match vimfilerTypeLink '.*\[LNK\]' contained
syntax match vimfilerTypeText '.* \~$' contained contains=vimfilerMarker
syntax match vimfilerTypeImage '.* !$' contained contains=vimfilerMarker
syntax match vimfilerTypeArchive '.* @$' contained contains=vimfilerMarker
syntax match vimfilerTypeExecute '.* #$' contained contains=vimfilerMarker
syntax match vimfilerTypeMultimedia '.* \$$' contained contains=vimfilerMarker
syntax match vimfilerTypeDirectory '.* %$' contained contains=vimfilerMarker
syntax match vimfilerTypeSystem '.* \^$' contained contains=vimfilerMarker
syntax match vimfilerTypeLink '.* &$' contained contains=vimfilerMarker

syntax match vimfilerSize '\s\zs[[:digit:].]\+\s*[GMKB]' contained

" syntax match vimfilerNonMark '^\s*|\?[+-]' contained
execute 'syntax match vimfilerNonMark'
 \ '''^\s*\%('. leaf_icon .'\)\?\%('. opened_icon . '\|'
 \ . closed_icon . '\|' . file_icon .'\)'' contained'

syntax match vimfilerDate '\s\zs#[^#]\+$' contains=vimfilerDateIgnore contained
syntax match vimfilerDateToday '\s\zs\~[^~]\+$' contains=vimfilerDateIgnore contained
syntax match vimfilerDateWeek '\s\zs![^!]\+$' contains=vimfilerDateIgnore contained
if has('conceal')
 " Supported conceal features.
 syntax match vimfilerDateIgnore '[#~!]' contained conceal
 syntax match   vimfilerMarker        '[~!@#$%^&]$' contained conceal
else
 syntax match vimfilerDateIgnore '[#~!]' contained
 syntax match   vimfilerMarker        '[~!@#$%^&]$' contained
endif

if has('gui_running')
 hi vimfilerCurrentDirectory guifg=#80ffff guibg=NONE
else
 hi def link vimfilerCurrentDirectory Identifier
endif
hi def link vimfilerMask Statement

hi def link vimfilerSpecial Special
hi def link vimfilerSpecialUnSafe Statement

hi def link vimfilerNonMark Special
"hi vimfilerMarkedFile gui=REVERSE term=REVERSE
hi def link vimfilerMarkedFile Structure
hi def link vimfilerDirectory Preproc
hi def link vimfilerSize Constant

hi def link vimfilerDateToday Statement
hi def link vimfilerDateWeek Special
hi def link vimfilerDate Identifier
hi def link vimfilerDateIgnore Ignore

hi def link vimfilerTypeText Constant
hi def link vimfilerTypeImage Type
hi def link vimfilerTypeArchive Special
hi def link vimfilerTypeExecute Statement
hi def link vimfilerTypeMultimedia Identifier
hi def link vimfilerTypeDirectory Preproc
hi def link vimfilerTypeSystem Comment
hi def link vimfilerTypeLink Comment


execute 'syntax match vimfilerPdf ' string('^ *'.g:vimfiler_file_icon.' .*\.\(pdf\|PDF\)[ \n]') ' contains=vimfilerIcon'
execute 'syntax match vimfilerTypeImage ' string('^ *'.g:vimfiler_file_icon.' .*\.\(eps\|EPS\)[ \n]')  ' contains=vimfilerIcon'
execute 'syntax match vimfilerHtml ' string('^ *'.g:vimfiler_file_icon.' .*\.\(html\|HTML\)[ \n]')  ' contains=vimfilerIcon'
execute "syntax match vimfilerIcon '^ *".g:vimfiler_file_icon." ' contained"
execute 'syntax match vimfilerTypeSystem ' string('^ *'.g:vimfiler_file_icon.' \(Makefile.in\|configure\|aclocal.m4\|autom4te.cache/\|Makefile\|stamp-h1\|config.log\|config.status\|config.h\|config.h.in\|output.0\|output.1\|requests\|traces.0\|traces.1\)[ \n]')  ' contains=vimfilerIcon'
execute 'syntax match vimfilerTypeSystem ' string('^ *'.g:vimfiler_file_icon.' \([A-Za-z0-9_-]*\(.o\|.hi\)\)[ \n]')  ' contains=vimfilerIcon'

highlight Archive ctermfg=12 guifg=#808079 guibg=#303030
highlight default link vimfilerPdf Function
highlight default link vimfilerHtml Function
highlight default link vimfilerDateToday Identifier
highlight default link vimfilerDate Boolean
highlight default link vimfilerTypeLink Constant
highlight default link vimfilerTypeExecute Special
highlight default link vimfilerTypeArchive Archive
highlight default link vimfilerTypeImage Boolean
highlight default link vimfilerIcon Boolean

highlight link vimfilerDateToday Comment
let b:current_syntax = 'vimfiler'

