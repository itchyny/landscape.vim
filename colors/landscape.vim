
set background=dark
highlight clear

let colors_name = "landscape"
if exists("syntax_on")
  syntax reset
endif

highlight Special ctermfg=178 guifg=178
highlight VertSplit guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=darkgray cterm=none
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray
highlight NonText ctermfg=black guifg=black
highlight Archive ctermfg=12 guifg=#808079 guibg=#303030
highlight Constant ctermfg=159 guifg=159
highlight Function ctermfg=40 guifg=40
highlight PreProc ctermfg=43 guifg=43
highlight StatusLineNC guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=darkgray cterm=none
if version >= 700
  highlight CursorLine ctermfg=none guifg=none
  highlight CursorColumn ctermfg=none guifg=none
  highlight MatchParen term=standout guifg=#f6f3e8 guibg=#857b6f gui=bold " ((((( )))))
  highlight Pmenu ctermfg=black ctermbg=gray guifg=black guibg=gray
  highlight PmenuSel ctermfg=black ctermbg=darkgray guifg=black guibg=darkgray
  highlight PmenuSbar ctermfg=white ctermbg=darkgray guifg=white guibg=darkgray
  highlight PmenuThumb ctermfg=white ctermbg=darkgray guifg=white guibg=darkgray
endif
call matchadd('Todo', 'todo')
call matchadd('Todo', 'Todo')
call matchadd('Todo', 'TODO')
call matchadd('Error', '　')
call matchadd('Underlined', '\(https\?\|ftp\):\/\/[0-9A-Za-z][&:()\[\]{}#@~%_\-=?/.0-9A-Za-z]*[/0-9A-Za-z]\(:\d\d*\/\?\)\?')
highlight Comment term=none ctermfg=243 ctermbg=none guifg=243 guibg=none
highlight String ctermfg=207 ctermbg=none guifg=207 guibg=none
highlight Character ctermfg=100 ctermbg=none guifg=100 guibg=none
highlight Number ctermfg=85 ctermbg=none guifg=85 guibg=none
highlight Boolean ctermfg=11 ctermbg=none guifg=11 guibg=none
highlight link Float Number
highlight Identifier term=none cterm=none ctermfg=104 ctermbg=none guifg=104 guibg=none
highlight Function ctermfg=46 ctermbg=none guifg=46 guibg=none

highlight Statement ctermfg=47 ctermbg=none guifg=47 guibg=none
highlight default link Conditional Statement
highlight default link Repeat Statement
highlight default link Label Statement
highlight Operator ctermfg=220 ctermbg=none guifg=220 guibg=none
highlight default link Keyword Statement
highlight default link Exception Statement

highlight Type ctermfg=210 ctermbg=none guifg=210 guibg=none

highlight Underlined term=underline ctermfg=51 ctermbg=none guifg=51 guibg=none
highlight Error ctermfg=15 ctermbg=124 guifg=15 guibg=124
highlight Todo ctermfg=16 ctermbg=11 guifg=16 guibg=11

" ColorColumn
" Conceal
" Cursor
" CursorIM
" Directory
" DiffAdd
" DiffChange
" DiffDelete
" DiffText
" ErrorMsg
" Folded
" FoldColumn
" SignColumn
" IncSearch
" LineNr
" ModeMsg
" MoreMsg
" Normal
" Question
" Search
" SpellBad
" SpellCap
" SpellLocal
" SpellRare
" StatusLine
" StatusLineNC
" TabLine
" TabLineFill
" TabLineSel
" Title
" Visual
" VisualNOS
" WarningMsg
" Include
" Define
" Macro
" PreCondit
" StorageClass
" Structure
" Typedef
" Tag
" Delimiter
" SpecialComment
" Debug
" Ignore
" WildMenu
