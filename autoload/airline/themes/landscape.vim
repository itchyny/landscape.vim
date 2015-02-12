" landscape color scheme for vim-airline

let s:c = {
  \ 'black'          : [16, '#000000'],
  \ 'white'          : [231, '#ffffff'],
  \
  \ 'darkestgreen'   : [22, '#005f00'],
  \ 'darkgreen'      : [28, '#008700'],
  \
  \ 'darkestcyan'    : [21, '#0000ff'],
  \ 'mediumcyan'     : [117, '#87dfff'],
  \
  \ 'darkestblue'    : [24, '#005f87'],
  \ 'darkblue'       : [31, '#0087af'],
  \
  \ 'darkestred'     : [52, '#5f0000'],
  \ 'darkred'        : [88, '#870000'],
  \ 'mediumred'      : [124, '#af0000'],
  \ 'brightred'      : [160, '#df0000'],
  \ 'brightestred'   : [196, '#ff0000'],
  \
  \ 'darkestyellow'  : [59, '#5f5f5f'],
  \ 'darkyellow'     : [100, '#878700'],
  \ 'darkestpurple'  : [57, '#5f00ff'],
  \ 'mediumpurple'   : [98, '#875fdf'],
  \ 'brightpurple'   : [189, '#dfdfff'],
  \
  \ 'brightorange'   : [208, '#ff8700'],
  \ 'brightestorange': [214, '#ffaf00'],
  \
  \ 'gray0'          : [233, '#121212'],
  \ 'gray1'          : [235, '#262626'],
  \ 'gray2'          : [236, '#303030'],
  \ 'gray3'          : [239, '#4e4e4e'],
  \ 'gray4'          : [240, '#585858'],
  \ 'gray5'          : [241, '#606060'],
  \ 'gray6'          : [244, '#808080'],
  \ 'gray7'          : [245, '#8a8a8a'],
  \ 'gray8'          : [247, '#9e9e9e'],
  \ 'gray9'          : [250, '#bcbcbc'],
  \ 'gray10'         : [252, '#d0d0d0'],
  \ }

" Normal mode
let s:N1 = [ 'darkestcyan', 'white' ]
let s:N2 = [ 'white', 'darkestcyan' ]
let s:N3 = [ 'white', 'gray2' ]

" Insert mode
let s:I1 = [ 'darkestgreen', 'white' ]
let s:I2 = [ 'white', 'darkestgreen' ]
let s:I3 = [ 'white', 'gray2' ]

" Visual mode
let s:V1 = [ 'darkestpurple', 'white' ]
let s:V2 = [ 'white', 'darkestpurple' ]
let s:V3 = [ 'white', 'gray2' ]

" Replace mode
let s:R1 = [ 'mediumred', 'white' ]
let s:R2 = [ 'white', 'mediumred' ]
let s:R3 = [ 'white', 'gray2' ]

" Replace mode
let s:RE = [ 'mediumred', 'white' ]

let s:file = copy(s:N3)

let g:airline#themes#landscape#palette = {}

let s:airline_z = [ 'gray2', 'gray10', '' ]
let s:airline_y = [ 'gray2', 'gray7', '' ]
let s:airline_x = [ 'gray9', 'gray4', '' ]

function! s:map(section1, section2, section3, file) abort
  return {
      \ 'airline_a':    [ s:c[a:section1[0]][1], s:c[a:section1[1]][1], s:c[a:section1[0]][0], s:c[a:section1[1]][0], get(a:section1, 2, 'bold') ],
      \ 'airline_b':    [ s:c[a:section2[0]][1], s:c[a:section2[1]][1], s:c[a:section2[0]][0], s:c[a:section2[1]][0], get(a:section2, 2, ''    ) ],
      \ 'airline_c':    [ s:c[a:section3[0]][1], s:c[a:section3[1]][1], s:c[a:section3[0]][0], s:c[a:section3[1]][0], get(a:section3, 2, ''    ) ],
      \ 'airline_z':    s:color(s:airline_z),
      \ 'airline_y':    s:color(s:airline_y),
      \ 'airline_x':    s:color(s:airline_x),
      \ 'airline_file': [ s:c[a:file[0]][1]    , s:c[a:file[1]][1]    , s:c[a:file[0]][0]    , s:c[a:file[1]][0]    , get(a:file    , 2, ''    ) ],
      \ }
endfunction

function! s:color(name) abort
  return [ s:c[a:name[0]][1], s:c[a:name[1]][1], s:c[a:name[0]][0], s:c[a:name[1]][0], a:name[2] ]
endfunction

let g:airline#themes#landscape#palette.normal = s:map(s:N1, s:N2, s:N3, s:file)

let g:airline#themes#landscape#palette.insert = s:map(s:I1, s:I2, s:I3, s:file)

let g:airline#themes#landscape#palette.visual = s:map(s:V1, s:V2, s:V3, s:file)

let g:airline#themes#landscape#palette.replace = s:map(s:R1, s:R2, s:R3, s:file)

" Inactive
let s:airline_z = [ 'gray2', 'gray0', '' ]
let s:airline_y = [ 'gray2', 'gray0', '' ]
let s:airline_x = [ 'gray2', 'gray0', '' ]
let s:A1 = [ 'gray2', 'gray0' ]
let s:A2 = [ 'gray2', 'gray0' ]
let s:A3 = [ 'gray2', 'gray0' ]
let g:airline#themes#landscape#palette.inactive = s:map(s:A1, s:A2, s:A3, s:file)

