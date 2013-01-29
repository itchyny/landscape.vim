if version < 700
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let leaf_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_leaf_icon)
let opened_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_opened_icon)
let closed_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_closed_icon)
let file_icon = vimfiler#util#escape_pattern(g:vimfiler_file_icon)
let marked_file_icon = vimfiler#util#escape_pattern(g:vimfiler_marked_file_icon)
let ro_file_icon = vimfiler#util#escape_pattern(g:vimfiler_readonly_file_icon)

syntax match vimfilerNonMarkedFile '.*'
 \ contains=vimfilerNonMark,vimfilerTypeText,vimfilerTypeImage,vimfilerTypeArchive,
 \vimfilerTypeExecute,vimfilerTypeMultimedia,vimfilerTypeDirectory,vimfilerTypeSystem,vimfilerTypeLink,
 \vimfilerSize,vimfilerDateWeek,vimfilerDate,vimfilerDateToday
execute 'syntax match vimfilerMarkedFile' '''^\s*\%(' . leaf_icon .'\)\?'
 \ . marked_file_icon . ' .*$'''
 \ 'contains=vimfilerDateWeek,vimfilerDate,vimfilerDateToday'
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
 \ . closed_icon . '\|' . ro_file_icon . '\|' . file_icon .'\)'' contained'

syntax match vimfilerDateWeek '\s\zs#[^#]\+$' contains=vimfilerDateIgnore contained
syntax match vimfilerDate '\s\zs\~[^~]\+$' contains=vimfilerDateIgnore contained
syntax match vimfilerDateToday '\s\zs![^!]\+$' contains=vimfilerDateIgnore contained
if has('conceal')
 " Supported conceal features.
 syntax match vimfilerDateIgnore '[#~!]' contained conceal
 syntax match   vimfilerMarker        '[~!@#$%^&]$' contained conceal
else
 syntax match vimfilerDateIgnore '[#~!]' contained
 syntax match   vimfilerMarker        '[~!@#$%^&]$' contained
endif

if has('gui_running')
 highlight vimfilerCurrentDirectory guifg=#80ffff guibg=NONE
else
 highlight default link vimfilerCurrentDirectory Identifier
endif
highlight default link vimfilerMask Statement

highlight default link vimfilerSpecial Special
highlight default link vimfilerSpecialUnSafe Statement

highlight default link vimfilerNonMark Icon
highlight default link vimfilerMarkedFile Marked
highlight default link vimfilerDirectory Preproc
highlight default link vimfilerSize Constant

highlight default link vimfilerDateToday DateToday
highlight default link vimfilerDateWeek DateWeek
highlight default link vimfilerDateIgnore Ignore
highlight default link vimfilerDate DateOld

execute 'syntax match vimfilerPdfHtml ' string('^ *'.g:vimfiler_file_icon.' .*\.\(pdf\|html\)[ \n]') ' contains=vimfilerIcon'
execute 'syntax match vimfilerTypeImage ' string('^ *'.g:vimfiler_file_icon.' .*\.\(eps\|EPS\)[ \n]')  ' contains=vimfilerIcon'
execute "syntax match vimfilerIcon '^ *".g:vimfiler_file_icon." ' contained"
execute 'syntax match vimfilerTypeSystem ' string('^ *'.g:vimfiler_file_icon.' \(#\S\+#\|Makefile\.in\|configure\|aclocal\.m4\|Makefile\|stamp-h1\|config\.status\|config\.h\|config\.h\.in\~\?\|output\.[0-9]\S\?\|requests\|traces\.[0-9]\S\?\|.*\.log\)[ \n]')  ' contains=vimfilerIcon'
execute 'syntax match vimfilerTypeSystem ' string('^ *'.g:vimfiler_file_icon.' \([A-Za-z0-9_-]*\(\.o\|\.hi\)\)[ \n]')  ' contains=vimfilerIcon'

highlight default link vimfilerTypeText Text
highlight default link vimfilerTypeDirectory Path
highlight default link vimfilerMarker Ignore
highlight default link vimfilerDateIgnore Ignore
highlight default link vimfilerPdfHtml PdfHtml
highlight default link vimfilerTypeLink Link
highlight default link vimfilerTypeExecute Exe
highlight default link vimfilerTypeArchive Archive
highlight default link vimfilerTypeImage Image
highlight default link vimfilerTypeMultimedia Multimedia
highlight default link vimfilerTypeSystem System
highlight default link vimfilerIcon Icon

let b:current_syntax = 'vimfiler'

