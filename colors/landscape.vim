
set background=dark
highlight clear

let colors_name = "landscape"
if exists("syntax_on")
  syntax reset
endif

highlight Normal gui=none guifg=White guibg=grey0
highlight Comment term=none ctermfg=243 ctermbg=none gui=none guifg=#767676
highlight Constant term=none ctermfg=159 gui=none guifg=#afffff
highlight String term=none ctermfg=215 ctermbg=none gui=none guifg=#ffaf5f
highlight Character term=none ctermfg=100 ctermbg=none gui=none guifg=#878700
highlight Number term=none ctermfg=45 ctermbg=none gui=none guifg=#00dfff
highlight Boolean term=none ctermfg=226 ctermbg=none gui=none guifg=#ffff00
highlight Float term=none ctermfg=43 ctermbg=none gui=none guifg=#00dfaf

highlight Identifier term=none cterm=none ctermfg=104 ctermbg=none gui=none guifg=#8787df
highlight Function term=none ctermfg=46 ctermbg=none gui=none guifg=#00ff00

highlight Statement term=none ctermfg=118 ctermbg=none gui=none guifg=#87ff00
highlight Conditional term=none ctermfg=166 ctermbg=none gui=none guifg=#df5f00
highlight default link Repeat Conditional
highlight default link Label Statement
highlight Operator term=none ctermfg=220 ctermbg=none gui=none guifg=#ffdf00
highlight default link Keyword Statement
highlight default link Exception Statement

highlight PreProc term=none ctermfg=39 gui=none guifg=#00afff
highlight Include term=none ctermfg=38 gui=none guifg=#00afdf
highlight Define term=none ctermfg=37 gui=none guifg=#00afaf
highlight Macro term=none ctermfg=36 gui=none guifg=#00af87
highlight PreCondit term=none ctermfg=35 gui=none guifg=#00af5f

highlight Type term=none ctermfg=207 ctermbg=none gui=none guifg=#ff5fff
highlight StorageClass term=none ctermfg=201 ctermbg=none gui=none guifg=#ff00ff
highlight Structure term=none ctermfg=200 ctermbg=none gui=none guifg=#ff00df
highlight Typedef term=none ctermfg=199 ctermbg=none gui=none guifg=#ff00af

highlight Special term=none ctermfg=178 gui=none guifg=orange
highlight SpecialChar term=none ctermfg=208 gui=none guifg=orange
highlight Tag term=none ctermfg=180 gui=none guifg=orange
highlight Delimiter term=none ctermfg=181 gui=none guifg=orange
highlight SpecialComment term=none ctermfg=182 gui=none guifg=violet
highlight Debug term=none ctermfg=183 gui=none guifg=violet

highlight Visual term=none ctermbg=239 guibg=#4e4e4e
highlight default link VisualNOS Visual 
highlight Underlined term=underline ctermfg=51 ctermbg=none gui=none guifg=#00ffff
highlight Error term=none ctermfg=15 ctermbg=124 gui=none guifg=#ffffff guibg=#af0000
highlight WarningMsg term=none ctermfg=7 ctermbg=0 gui=none guifg=#c0c0c0 guibg=#000000
highlight Todo term=none ctermfg=16 ctermbg=11 gui=none guifg=#000000 guibg=#ffff00
highlight default link ErrorMsg Error

highlight VertSplit term=none gui=none guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=darkgray cterm=none
highlight Folded term=none ctermfg=247 ctermbg=235 guifg=#9e9e9e guibg=#262626
highlight SpecialKey term=underline ctermfg=darkgray gui=none guifg=darkgray
highlight NonText term=none ctermfg=black gui=none guifg=black
highlight Archive term=none ctermfg=12 gui=none guifg=#808079 guibg=#303030
highlight StatusLineNC term=none gui=none guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=darkgray cterm=none gui=none
if version >= 700
  highlight CursorLine ctermfg=none
  highlight CursorColumn ctermfg=none
  highlight MatchParen ctermfg=none ctermbg=8 guibg=gray
  highlight Pmenu ctermfg=black ctermbg=gray gui=none guifg=black guibg=gray
  highlight PmenuSel ctermfg=black ctermbg=darkgray gui=none guifg=black guibg=darkgray
  highlight PmenuSbar ctermfg=white ctermbg=darkgray gui=none guifg=white guibg=darkgray
  highlight PmenuThumb ctermfg=white ctermbg=darkgray gui=none guifg=white guibg=darkgray
endif
augroup MatchAdd
  function! s:newmatch()
    call matchadd('Underlined',
          \'\(https\?\|ftp\|git\):\/\/\('
          \.'[&:#*@~%_\-=?/.0-9A-Za-z]*'
          \.'\(([&:#*@~%_\-=?/.0-9A-Za-z]*)\)\?'
          \.'\({\([&:#*@~%_\-=?/.0-9A-Za-z]*\|{[&:#*@~%_\-=?/.0-9A-Za-z]*}\)}\)\?'
          \.'\(\[[&:#*@~%_\-=?/.0-9A-Za-z]*\]\)\?'
          \.'\)*[/0-9A-Za-z]*\(:\d\d*\/\?\)\?')
    call matchadd('Todo', 'todo')
    call matchadd('Todo', 'Todo')
    call matchadd('Todo', 'TODO')
    call matchadd('Error', '　')
  endfunction
  autocmd!
  autocmd BufAdd,BufCreate,BufEnter,WinEnter * call s:newmatch()
augroup END
highlight Time ctermfg=135 ctermbg=none gui=none guifg=#af5fff
highlight Date ctermfg=134 ctermbg=none gui=none guifg=#af5fdf

highlight default link SpellBad ErrorMsg
highlight default link SpellCap WarningMsg
highlight default link SpellLocal WarningMsg
highlight default link SpellRare WarningMsg

highlight default link vimCmplxRepeat Normal

" ColorColumn
" Conceal
" Cursor
" CursorIM
" Directory
" FoldColumn
" SignColumn
" IncSearch
" LineNr
" ModeMsg
" MoreMsg
" Question
" Search
" StatusLine
" TabLine
" TabLineFill
" TabLineSel
" Title
" Ignore
" WildMenu
