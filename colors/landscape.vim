
set background=dark
highlight clear

let colors_name = "landscape"
if exists("syntax_on")
  syntax reset
endif

highlight Comment term=none ctermfg=243 ctermbg=none guifg=243 guibg=none

highlight Constant ctermfg=159 guifg=159
highlight String ctermfg=215 ctermbg=none guifg=215 guibg=none
highlight Character ctermfg=100 ctermbg=none guifg=100 guibg=none
highlight Number ctermfg=45 ctermbg=none guifg=45 guibg=none
highlight Boolean ctermfg=226 ctermbg=none guifg=226 guibg=none
highlight Float ctermfg=43 ctermbg=none guifg=43 guibg=none

highlight Identifier term=none cterm=none ctermfg=104 ctermbg=none guifg=104 guibg=none
highlight Function ctermfg=46 ctermbg=none guifg=46 guibg=none

highlight Statement ctermfg=118 ctermbg=none guifg=118 guibg=none
highlight Conditional ctermfg=166 ctermbg=none guifg=166 guibg=none
highlight default link Repeat Conditional
highlight default link Label Statement
highlight Operator ctermfg=220 ctermbg=none guifg=220 guibg=none
highlight default link Keyword Statement
highlight default link Exception Statement

highlight PreProc ctermfg=39 guifg=39
highlight Include ctermfg=38 guifg=38
highlight Define ctermfg=37 guifg=37
highlight Macro ctermfg=36 guifg=36
highlight PreCondit ctermfg=35 guifg=35

highlight Type ctermfg=207 ctermbg=none guifg=207 guibg=none
highlight StorageClass ctermfg=201 ctermbg=none guifg=201 guibg=none
highlight Structure ctermfg=200 ctermbg=none guifg=200 guibg=none
highlight Typedef ctermfg=199 ctermbg=none guifg=199 guibg=none

highlight Special ctermfg=178 guifg=178
highlight SpecialChar ctermfg=208 guifg=208
highlight Tag ctermfg=180 guifg=180
highlight Delimiter ctermfg=181 guifg=181
highlight SpecialComment ctermfg=182 guifg=182
highlight Debug ctermfg=183 guifg=183

highlight Underlined term=underline ctermfg=51 ctermbg=none guifg=51 guibg=none
highlight Error ctermfg=15 ctermbg=124 guifg=15 guibg=124
highlight Todo ctermfg=16 ctermbg=11 guifg=16 guibg=11
highlight default link ErrorMsg Error

highlight VertSplit guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=darkgray cterm=none
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray
highlight NonText ctermfg=black guifg=black
highlight Archive ctermfg=12 guifg=#808079 guibg=#303030
highlight StatusLineNC guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=darkgray cterm=none
if version >= 700
  highlight CursorLine ctermfg=none guifg=none
  highlight CursorColumn ctermfg=none guifg=none
  highlight MatchParen term=reverse ctermfg=none ctermbg=1 guifg=none guibg=1
  highlight Pmenu ctermfg=black ctermbg=gray guifg=black guibg=gray
  highlight PmenuSel ctermfg=black ctermbg=darkgray guifg=black guibg=darkgray
  highlight PmenuSbar ctermfg=white ctermbg=darkgray guifg=white guibg=darkgray
  highlight PmenuThumb ctermfg=white ctermbg=darkgray guifg=white guibg=darkgray
endif
call matchadd('Todo', 'todo')
call matchadd('Todo', 'Todo')
call matchadd('Todo', 'TODO')
call matchadd('Error', '　')
call matchadd('Underlined', '\(https\?\|ftp\|git\):\/\/[0-9A-Za-z][&:()\[\]{}#@~%_\-=?/.0-9A-Za-z]*[/0-9A-Za-z]\(:\d\d*\/\?\)\?')

highlight Time ctermfg=135 ctermbg=none guifg=135 guibg=none
highlight Date ctermfg=133 ctermbg=none guifg=133 guibg=none
" ColorColumn
" Conceal
" Cursor
" CursorIM
" Directory
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
" Ignore
" WildMenu
