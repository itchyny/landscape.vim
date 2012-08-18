
if version < 700
 syntax clear
elseif exists('b:current_syntax')
 finish
endif

let leaf_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_leaf_icon)
let opened_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_opened_icon)
let closed_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_closed_icon)
let file_icon = vimfiler#util#escape_pattern(g:vimfiler_file_icon)
let marked_file_icon = vimfiler#util#escape_pattern(g:vimfiler_marked_file_icon)

syn match vimfilerNonMarkedFile '.*'
 \ contains=vimfilerNonMark,vimfilerTypeText,vimfilerTypeImage,vimfilerTypeArchive,
 \vimfilerTypeExecute,vimfilerTypeMultimedia,vimfilerTypeDirectory,vimfilerTypeSystem,vimfilerTypeLink,
 \vimfilerSize,vimfilerDate,vimfilerDateToday,vimfilerDateWeek
execute 'syn match vimfilerMarkedFile' '''^\s*\%(' . leaf_icon .'\)\?'
 \ . marked_file_icon . ' .*$'''
 \ 'contains=vimfilerDate,vimfilerDateToday,vimfilerDateWeek'
syn match vimfilerDirectory '^..$'

syn match vimfilerPrompt '^\[in\]: .*$'
 \ contains=vimfilerSpecial,vimfilerCurrentDirectory
syn match vimfilerPromptUnSafe '^! \[in\]: .*$'
 \ contains=vimfilerSpecial,vimfilerSpecialUnSafe,vimfilerCurrentDirectory
syn match vimfilerSpecialUnSafe '^! ' contained
syn match vimfilerSpecial '\[in\]:' contained
syn match vimfilerCurrentDirectory '\s\zs.*$' contained contains=vimfilerMask
syn match vimfilerMask '\[.*\]$' contained
syn match vimfilerFileLine '\[.*\]$' contained

syn match vimfilerTypeText '.*\[TXT\]' contained
syn match vimfilerTypeImage '.*\[IMG\]' contained
syn match vimfilerTypeArchive '.*\[ARC\]' contained
syn match vimfilerTypeExecute '.*\[EXE\]' contained
syn match vimfilerTypeMultimedia '.*\[MUL\]' contained
syn match vimfilerTypeDirectory '.*\[DIR\]' contained
syn match vimfilerTypeSystem '.*\[SYS\]' contained
syn match vimfilerTypeLink '.*\[LNK\]' contained

syn match vimfilerSize '\s\zs[[:digit:].]\+\s*[GMKB]' contained

" syn match vimfilerNonMark '^\s*|\?[+-]' contained
execute 'syn match vimfilerNonMark'
 \ '''^\s*\%('. leaf_icon .'\)\?\%('. opened_icon . '\|'
 \ . closed_icon . '\|' . file_icon .'\)'' contained'

syn match vimfilerDate '\s\zs#[^#]\+$' contains=vimfilerDateIgnore contained
syn match vimfilerDateToday '\s\zs\~[^~]\+$' contains=vimfilerDateIgnore contained
syn match vimfilerDateWeek '\s\zs![^!]\+$' contains=vimfilerDateIgnore contained
if has('conceal')
 " Supported conceal features.
 syn match vimfilerDateIgnore '[#~!]' contained conceal
else
 syn match vimfilerDateIgnore '[#~!]' contained
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


execute 'syntax match vimfilerPdf ' string('^'.g:vimfiler_file_icon.' .*\(pdf\|PDF\)')  ' contains=vimfilerIcon'
execute 'syntax match vimfilerHtml ' string('^'.g:vimfiler_file_icon.' .*\(html\|HTML\)')  ' contains=vimfilerIcon'
execute "syntax match vimfilerIcon '^".g:vimfiler_file_icon." ' contained"

" syntax match vimfilerConflict '(Case Conflict \d*)'
" highlight default link vimfilerConflict Error

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
