if exists('g:landscape_syntax_unite') && g:landscape_syntax_unite == 0
  finish
endif

if version < 700
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

try
  if exists('*unite#view#_set_syntax')
    call unite#view#_set_syntax()
  elseif exists('*unite#view#_set_highlight')
    call unite#view#_set_highlight()
  else
    call unite#set_highlight()
  endif
catch
endtry

" error
syntax region uniteError start=+!!!+ end=+!!!+ contains=uniteErrorHidden oneline
if has('conceal')
  syntax match uniteErrorHidden '!!!' contained conceal
else
  syntax match uniteErrorHidden '!!!' contained
endif
highlight default link uniteError Error
highlight default link uniteErrorHidden Ignore

syntax match uniteSourcePrompt /^Sources/ contained nextgroup=uniteSeparator
syntax match uniteSeparator /:/ contained nextgroup=uniteSourceNames
syntax match uniteSourceNames / [[:alnum:]_\/-]\+/ contained nextgroup=uniteSourceArgs,uniteCommand
syntax match uniteSourceArgs /:\S\+/ contained
highlight default link uniteSourcePrompt Prompt
highlight default link uniteSeparator NONE
highlight default link uniteSourceArgs Function

" git
syntax match uniteGitCommand /git .*/ contained contains=uniteGit,uniteGitArg,uniteSpecial,uniteCommand containedin=uniteSource__NeoBundleInstall_Progress
syntax match uniteGitArg /\-\S\+/ contained
syntax match uniteGit /git/ contained
syntax match uniteSpecial '[|<>;&]' contained
syntax match uniteCommand '[|;&]\s*\f\+' contains=uniteSpecial contained
syntax match uniteBundleName /|\@<=\S\+|\@=/ contained containedin=uniteSource__NeoBundleInstall_Source
highlight default link uniteGitCommand GitCommand
highlight default link uniteGitArg Arguments
highlight default link uniteGit Command
highlight default link uniteBundleName Identifier
highlight link uniteSource__NeoBundleInstall_Source Normal
highlight link uniteSource__NeoBundleInstall_Progress Normal

" string
syntax match uniteStringSpecial '\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)' contained
syntax region uniteString start=+"+ end=+"+ contains=uniteCandidateAbbr,uniteStringSpecial,uniteCandidateInputKeyword oneline contained
syntax region uniteString start=+'+ end=+'+ contains=uniteCandidateAbbr,uniteStringSpecial,uniteCandidateInputKeyword oneline contained
highlight default link uniteStringSpecial SpecialChar
highlight default link uniteString String

" files
syntax region uniteFile start='.' end='[^\s]\(\s\s\s\)\@=' contained containedin=uniteCandidateAbbr,uniteSource__VimfilerDrive,uniteSource__File,uniteSource__FileMru,uniteSource__File contains=uniteCandidateInputKeyword
syntax match uniteGrepFile '\%(^- *\)\@<=[^:]*' contained containedin=uniteSource__GrepLine,uniteSource__Grep
syntax match unitePath '.*/' oneline contained containedin=uniteFile contains=uniteCandidateInputKeyword
syntax region unitePdfHtml start='.' end='\.\(pdf\|html\)\>\(\s\s\)\@=' oneline contained containedin=uniteFile contains=uniteCandidateInputKeyword,unitePath 
syntax region uniteArchive start='.' end='\.\(lha\|lzh\|zip\|gz\|bz2\|cab\|rar\|7z\|tgz\|tar\)\>\(\s\s\)\@=' oneline contained containedin=uniteFile contains=uniteCandidateInputKeyword,unitePath 
syntax region uniteImage start='.' end='\.\(eps\|bmp\|BMP\|png\|PNG\|gif\|GIF\|JPE\?G\|jpe\?g\|jp2\|tif\|ico\|wdp\|cur\|ani\)\>\(\s\s\)\@=' oneline contained containedin=uniteFile contains=uniteCandidateInputKeyword,unitePath 
syntax region uniteTypeMultimedia start='.' end='\.\(
      \.avi\|asf\|wmv\|flv\|swf\|divx\|mov\|m1a\|
      \.m2[ap]\|mpe\?g\|m[12]v\|mp2v\|mp[34a]\|qt\|ra\|rm\|ram\|
      \.rmvb\|rpm\|smi\|mkv\|mid\|wav\|ogg\|wma\|au\|flac\)\>\(\s\s\)\@=' oneline contained containedin=uniteFile contains=uniteCandidateInputKeyword,unitePath 
syntax region uniteTypeSystem start='.' end='\.\(o\|hi\|inf\|sys\|reg\|dat\|spi\|a\|so\|lib\|dll\|log\)\>\(\s\s\)\@=' oneline contained containedin=uniteFile contains=uniteCandidateInputKeyword,unitePath 
syntax match uniteTypeSystem '\(#\S\+#\|configure[\s$]\|aclocal\.m4\|[Mm]akefile\(\.in\)\?\|stamp-h1\|config\.\(h\(\.in\~\?\)\?\|status\)\|output\.[0-9]\S\?\|requests\|traces\.[0-9]\S\?\)\s\@=' contained containedin=uniteFile contains=uniteCandidateInputKeyword,unitePath 
syntax match uniteTypeSystem '\(y\.tab\.c\|y\.output\|lex\.yy\.c\|y\.tab\.h\)\s\@=' contained containedin=uniteFile contains=uniteCandidateInputKeyword,unitePath 
syntax match uniteNewFile '\[new \(file\|directory\)\]' contained containedin=uniteFile,uniteSource__FileNew contains=uniteCandidateInputKeyword
highlight default link unitePath Path
highlight default link uniteGrepFile Path
highlight default link unitePdfHtml PdfHtml
highlight default link uniteArchive Archive
highlight default link uniteImage Image
highlight default link uniteTypeMultimedia Multimedia
highlight default link uniteTypeSystem System
highlight default link uniteSource__Buffer_NoFile Conditional
highlight default link uniteNewFile uniteSource__Buffer_NoFile 

syntax region uniteMarkedLine start=/^\*/ end='$' keepend
syntax match uniteCandidateSourceName /\(^- \+\)\@<=[[:alnum:]_\/-]\+/ contained
syntax match uniteCandidateMarker /^-\? \+/ contained
syntax match uniteQuickMatchTrigger /^.|/ contained
syntax match uniteNumber '\<\d\+\>' contained containedin=uniteStatusLine,uniteSource__NeoBundleInstall_Progress
syntax match uniteLineNumber '\(^-\? \++\? *\%(\f\+:\)\?\)\@<=\<\d\+\>' contained containedin=uniteSource__Line,uniteSource__LineFast,uniteSource__Grep
highlight default link uniteNumber Number
highlight default link uniteLineNumber LineNr
highlight default link uniteMarkedLine Marked
highlight default link uniteQuickMatchTrigger Special
highlight default link uniteCandidateSourceName uniteSourceNames
highlight default link uniteCandidateMarker Icon
highlight default link uniteCandidateInputKeyword Comment

" vimshell history
syntax match uniteSpecial '[|<>;&]' contained
syntax match uniteCommand '\(^-\? \+vimshell/history\s\+\)\@<=\S\+' contained contains=uniteCandidateInputKeyword
syntax match uniteCommand '[|;&]\s*\f\+' contains=uniteSpecial,uniteCandidateInputKeyword contained
syntax match uniteArguments '\s-\=-[[:alnum:]-]\+' contained contains=uniteCandidateInputKeyword
syntax match uniteVimshellHistory '.*' contains=uniteSpecial,uniteCommand,uniteString,GitHubCommand,uniteNumber,uniteArguments,uniteDotFiles,uniteCandidateSourceName contained containedin=uniteSource__VimshellHistory,uniteSource__VimShellHistoryVimshell,uniteSource__VimShellExternalHistoryVimshell
highlight default link uniteSpecial Special
highlight default link uniteCommand Command
highlight default link uniteArguments Arguments

" file_mru
syntax match uniteSource__FileMru_Time '(\d\{4}/\d\d/\d\d \d\d:\d\d:\d\d)' containedin=uniteFile,unitePath

" neobundle/update
syntax match uniteMessage /^-\? \+\[.\{-}\].*$/ contains=uniteMessageSource,uniteNumber,uniteGitCommand,uniteBundleName
syntax match uniteMessageSource /^-\? \+\[.\{-}\]/ contained
highlight default link uniteSourceNames Constant
highlight default link uniteMessage NONE
highlight default link uniteMessageSource Constant

highlight default link uniteChooseAction NONE
highlight default link uniteChooseCandidate NONE
highlight default link uniteChooseKey SpecialKey
highlight default link uniteChooseMessage NONE
highlight default link uniteChoosePrompt uniteSourcePrompt
highlight default link uniteChooseSource uniteSourceNames
highlight default link uniteSource__FileMru_Time Date
highlight default link uniteSource__Buffer_Time Time
highlight default link uniteSource__NeoBundleInstall_Progress Normal
highlight default link uniteSource__NeoBundleInstall_Source Normal
highlight default link uniteInputPrompt Prompt
highlight default link uniteInputPromptError Error
highlight default link uniteInputSpecial Special

let b:current_syntax = 'unite'

