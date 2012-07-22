
let s:icon = g:vimfiler_file_icon
execute "syntax match vimfilerPdf '^".s:icon." .*pdf ' contains=vimfilerIcon"
execute "syntax match vimfilerHtml '^".s:icon." .*html ' contains=vimfilerIcon"
execute "syntax match vimfilerIcon '^".s:icon." ' contained"

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
