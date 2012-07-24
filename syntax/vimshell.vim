
if version < 700
 syntax clear
elseif exists("b:current_syntax")
 finish
endif

execute 'syntax match vimshellPrompt'
 \ string('^' . vimshell#escape_match(vimshell#get_prompt()))
execute 'syntax match vimshellPrompt'
 \ string('^' . vimshell#escape_match(vimshell#get_secondary_prompt()))
syntax match vimshellUserPrompt '^\[%\] .*$' contains=vimshellUserPromptHidden
syntax region vimshellString start=+'+ end=+'+ oneline contained
syntax region vimshellString start=+"+ end=+"+ contains=vimshellQuoted oneline contained
syntax region vimshellString start=+`+ end=+`+ oneline contained
syntax match vimshellString '[''"`]$' contained contained
syntax region vimshellError start=+!!!+ end=+!!!+ contains=vimshellErrorHidden oneline
syntax match vimshellComment '#.*$' contained
syntax match vimshellConstants '[+-]\=\<\d\+\>'
syntax match vimshellConstants '[+-]\=\<0x\x\+\>'
syntax match vimshellConstants '[+-]\=\<0\o\+\>'
syntax match vimshellConstants '[+-]\=\d\+#[-+]\=\w\+\>'
syntax match vimshellConstants '[+-]\=\d\+\.\d\+\([eE][+-]\?\d\+\)\?\>'
syntax match vimshellExe '\%(^\|\s\)[[:alnum:]_.][[:alnum:]_.-]\+\*[[:blank:]\n]'
syntax match vimshellSocket '\%(^\|\s\)[[:alnum:]_.][[:alnum:]_.-]\+=[[:blank:]\n]'
syntax match vimshellDotFiles '\%(^\|\s\)\.[[:alnum:]_.-]\+[[:blank:]\n]'
syntax match vimshellArguments '\s-\=-[[:alnum:]-]\+=\=' contained
syntax match vimshellQuoted '\\.' contained
syntax match vimshellSpecial '[|<>;&;]' contained
syntax match vimshellVariable '$\h\w*' contained
syntax match vimshellVariable '$$\h\w*' contained
syntax region vimshellVariable start=+${+ end=+}+ contained
if vimshell#util#is_windows()
 syntax match vimshellArguments '\s/[?:,_[:alnum:]]\+\ze\%(\s\|$\)' contained
 syntax match vimshellDirectory '\%(\f\s\?\)\+[/\\]\ze\%(\s\|$\)'
 syntax match vimshellLink '\([[:alnum:]_.-]\+\.lnk\)'
else
 syntax match vimshellDirectory '\%(\f\s\?\)\+/\ze\%(\s\|$\)'
 syntax match vimshellLink '\(^\|\s\)[[:alnum:]_.][[:alnum:]_.-]\+@'
endif

if has('conceal')
 " Supported conceal features.
 syntax match vimshellErrorHidden '!!!' contained conceal
 syntax match vimshellUserPromptHidden '^\[%\] ' contained conceal
else
 syntax match vimshellErrorHidden '!!!' contained
 syntax match vimshellUserPromptHidden '^\[%\] ' contained
endif

execute "syntax region vimshellExe start=".string('^'.vimshell#escape_match(vimshell#get_prompt()))
 \ "end='[^[:blank:]]\\+\\zs[[:blank:]\\n]' contained contains=vimshellPrompt,".
 \ "vimshellSpecial,vimshellConstants,vimshellArguments,vimshellString,vimshellComment"
syntax match vimshellExe '[|;]\s*\f\+' contained contains=vimshellSpecial,vimshellArguments
execute "syntax region vimshellLine start=".string('^'.vimshell#escape_match(vimshell#get_prompt()))
 \ "end='$' keepend contains=vimshellExe,vimshellDirectory,vimshellConstants,vimshellArguments,".
 \ "vimshellQuoted,vimshellString,vimshellVariable,vimshellSpecial,vimshellComment"

execute 'syntax region vimshellExe start='.string('^'.vimshell#escape_match(vimshell#get_secondary_prompt()))
 \ "end='[^[:blank:]]\\+\\zs[[:blank:]\\n]' contained contains=vimshellPrompt,".
 \ "vimshellSpecial,vimshellConstants,vimshellArguments,vimshellString,vimshellComment"
execute 'syntax region vimshellLine start='.string('^'.vimshell#escape_match(vimshell#get_secondary_prompt()))
 \ "end='$' keepend contains=vimshellExe,vimshellDirectory,vimshellConstants,vimshellArguments,".
 \ "vimshellQuoted,vimshellString,vimshellVariable,vimshellSpecial,vimshellComment"

highlight default link vimshellPrompt Identifier
highlight default link vimshellUserPrompt Special

highlight default link vimshellQuoted Special
highlight default link vimshellString String
highlight default link vimshellArguments Type
highlight default link vimshellConstants Constant
highlight default link vimshellSpecial PreProc
highlight default link vimshellVariable Comment
highlight default link vimshellComment Identifier
highlight default link vimshellNormal Normal

highlight default link vimshellExe Statement
highlight default link vimshellDirectory Preproc
highlight default link vimshellSocket Constant
highlight default link vimshellLink Comment
highlight default link vimshellDotFiles Identifier
highlight default link vimshellError Error
highlight default link vimshellErrorHidden Ignore
highlight default link vimshellUserPromptHidden Ignore

" MPlayer
syntax match vimshellCompilername '^!*MPlayer .*2000.*Team.*$'
syntax match mplayerPlaying '^Playing '
syntax match mplayerTitle '\( *Title:\)\@<=\(.*\)$'
syntax match mplayerStarting '^Starting playback\.\.\.$'
highlight default link mplayerPlaying PreProc
highlight default link mplayerPlayingFileName Special
highlight default link mplayerTag Constant
highlight default link mplayerTagName Function
highlight default link mplayerStarting Number
highlight default link mplayerTitle Special

" Haskell
let s:hsprompt='Prelude[^>]*>'
execute "syntax match vimshellHsPrompt '".s:hsprompt."'"
highlight default link vimshellHsPrompt vimshellPrompt
execute "syntax match vimshellHsCommand '".s:hsprompt." *:$' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(a\\|b\\|c\\|d\\|e\\|f\\|h\\|i\\|k\\|l\\|m\\|p\\|q\\|r\\|s\\|t\\|u\\|?\\)' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(ab\\|ad\\|ba\\|br\\|cd\\|cm\\|co\\|ct\\|de\\|ed\\|et\\|fo\\|he\\|hi\\|in\\|ki\\|li\\|lo\\|ma\\|mo\\|pr\\|qu\\|re\\|ru\\|se\\|sh\\|sp\\|st\\|tr\\|ty\\|un\\)' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(aba\\|add\\|bac\\|bre\\|bro\\|cmd\\|con\\|cta\\|def\\|del\\|edi\\|eta\\|for\\|hel\\|his\\|inf\\|kin\\|lis\\|loa\\|mai\\|mod\\|pri\\|qui\\|rel\\|run\\|set\\|sho\\|spr\\|ste\\|tra\\|typ\\|und\\|uns\\)' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(back\\|brea\\|brow\\|cont\\|ctag\\|dele\\|edit\\|etag\\|forc\\|forw\\|help\\|hist\\|info\\|kind\\|list\\|load\\|main\\|modu\\|prin\\|quit\\|relo\\|show\\|spri\\|step\\|trac\\|type\\|unde\\|unse\\)' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(break\\|brows\\|conti\\|ctags\\|delet\\|etags\\|force\\|forwa\\|histo\\|modul\\|print\\|reloa\\|sprin\\|stepl\\|stepm\\|trace\\|undef\\|unset\\)' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(browse\\|contin\\|delete\\|forwar\\|histor\\|module\\|reload\\|sprint\\|steplo\\|stepmo\\)' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(abandon\\|continu\\|forward\\|history\\|steploc\\|stepmod\\)' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(continue\\|steploca\\|stepmodu\\)' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(steplocal\\|stepmodul\\)' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(stepmodule\\)' contains=vimshellHsPrompt"
highlight default link vimshellHsCommand vimshellExe
syntax match vimshellHsLoadingPre '^Loading package '
highlight default link vimshellHsLoadingPre Constant
syntax match vimshellHsLoadingPre ' \.\.\.[^.]*\.\.\.[^.]*\.$'
highlight default link vimshellHsLoadingPost Constant
syntax match vimshellHsLoadingPackage '^Loading package .*' contains=vimshellHsLoadingPre,vimshellHsLoadingPost
highlight default link vimshellHsLoadingPackage Special
syntax match vimshellCompilername '^GHCi, version \d*\.\d*\.\d*.*$' contains=vimshellURL
syntax match vimshellCompilername '^The Glorious Glasgow Haskell Compilation System, .*$'
" syntax keyword vimshellStatement do case of let in
syntax match vimshellStatement '\(\(\<let\>\s\s*[^=][^=]*.*=.*\)\@<=\<in\>\|\<let\>\(\s\s*[^=][^=]*.*=.*\<in\>\)\@=\|\<let\>\(\s\s*[^=][^=]*=.*$\)\@=\)'
" syntax keyword vimshellConditional if then else at
syntax match vimshellConditional '\(\<if\>\(.*\<then\>.*\<else\>.*\)\@=\|\(\<if\>.*\)\@<=\<then\>\(.*\<else\>\)\@=\|\(\<if\>.*\<then\>.*\)\@<=\<else\>\)'

" Python
syntax match vimshellPyPrompt '>>>'
highlight default link vimshellPyPrompt vimshellPrompt
syntax match vimshellError '^SyntaxError.*$'
syntax match vimshellCompilername '^Python \d*\.\d*\.\d* ([^)]*) *$'
syntax match vimshellCompilername '^Python \d*\.\d*\.\d*$'
syntax match vimshellCompilerdescription '^Python \d*.\d*.\d* ([^)]*).*\n\(.*\n\)*.*for more information.$' contains=vimshellCompilername
syntax match vimshellStatement '\<lambda\>\(\s\s*\w\w*:\)\@='
syntax match vimshellConditional '\(\<if\>\(.*\<else\>\)\@=\|\(\<if\>.*\)\@<=\<else\>\)'

" Perl
syntax match vimshellCompilername '^This is perl.*built for.*$'
syntax match vimshellCompilerdescription '^This is perl.*built for.*\(\n.*\)*Home Page.*$' contains=vimshellCompilername

" Ruby
syntax match vimshellCompilername 'ruby \d*\.\d*\.\d*.*$'

" GCC
syntax match vimshellCompilername '^[^ ]*gcc.\d*\.\d*\(\.\d*\)\?.*$'
syntax match vimshellCompilerdescription '^[^ ]*gcc.\d*\.\d*\(\.\d*\)\?.*\(\n.*\)*A PARTICULAR PURPOSE.*$' contains=vimshellCompilername

" TeX
syntax match vimshellCompilername '^This is \(\w*TeX\w*\), Version.*$'

" shell
syntax match vimshellCompilername '^\(zsh\|tcsh\) \d*\.\d*\.\d.*$'
syntax match vimshellCompilername '^GNU bash, version \d*\.\d*\.\d.*$'
syntax match vimshellCompilerdescription '^GNU bash, version \d*\.\d*\.\d.*\(\n.*\)*Inc.' contains=vimshellCompilername

" git
syntax match vimshellCompilername '^git version \d*\.\d*\.\d.*$'

" man




highlight default link vimshellTime Number
highlight default link vimshellDate Constant
highlight default link vimshellConstants Number
highlight default link vimshellError Error

highlight default link vimShellLink Constant
highlight default link vimShellExe Statement
highlight default link vimShellUserPrompt Function
highlight default link vimShellPrompt_ vimshellPrompt
highlight default link vimshellTypeArchive Archive

syntax region vimshellString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syntax region vimshellString start=+'+ end=+'+ oneline
syntax region vimshellString start=+`+ end=+"+ oneline
syntax region vimshellString start=+`+ end=+`+ oneline
syntax region vimshellString start=+`+ end=+'+ oneline
syntax match vimshellCharacter '\'.\''
syntax keyword vimshellType Bool Bounded Char Double Either Enum Eq FilePath Float Floating Fractional Functor IO IOError Int Integer Integral Maybe Monad Num Ord Ordering Rational Read ReadS Real RealFloat RealFrac Show ShowS String function
syntax keyword vimshellBoolean True False true false
execute "syntax match vimshellFunction '\\(".s:hsprompt.".*\\)\\@<=\\(\\<abs\\>\\|\\<acos\\>\\|\\<acosh\\>\\|\\<all\\>\\|\\<and\\>\\|\\<any\\>\\|\\<appendFile\\>\\|\\<asTypeOf\\>\\|\\<asin\\>\\|\\<asinh\\>\\|\\<atan\\>\\|\\<atan2\\>\\|\\<atanh\\>\\|\\<break\\>\\|\\<catch\\>\\|\\<ceiling\\>\\|\\<compare\\>\\|\\<concat\\>\\|\\<concatMap\\>\\|\\<const\\>\\|\\<cos\\>\\|\\<cosh\\>\\|\\<curry\\>\\|\\<cycle\\>\\|\\<decodeFloat\\>\\|\\<div\\>\\|\\<divMod\\>\\|\\<drop\\>\\|\\<dropWhile\\>\\|\\<either\\>\\|\\<elem\\>\\|\\<encodeFloat\\>\\|\\<enumFrom\\>\\|\\<enumFromThen\\>\\|\\<enumFromThenTo\\>\\|\\<enumFromTo\\>\\|\\<error\\>\\|\\<even\\>\\|\\<exp\\>\\|\\<exponent\\>\\|\\<fail\\>\\|\\<filter\\>\\|\\<flip\\>\\|\\<floatDigits\\>\\|\\<floatRadix\\>\\|\\<floatRange\\>\\|\\<floor\\>\\|\\<fmap\\>\\|\\<foldl\\>\\|\\<foldl1\\>\\|\\<foldr\\>\\|\\<foldr1\\>\\|\\<fromEnum\\>\\|\\<fromInteger\\>\\|\\<fromIntegral\\>\\|\\<fromRational\\>\\|\\<fst\\>\\|\\<gcd\\>\\|\\<getChar\\>\\|\\<getContents\\>\\|\\<getLine\\>\\|\\<head\\>\\|\\<id\\>\\|\\<init\\>\\|\\<interact\\>\\|\\<ioError\\>\\|\\<isDenormalized\\>\\|\\<isIEEE\\>\\|\\<isInfinite\\>\\|\\<isNaN\\>\\|\\<isNegativeZero\\>\\|\\<iterate\\>\\|\\<last\\>\\|\\<lcm\\>\\|\\<length\\>\\|\\<lex\\>\\|\\<lines\\>\\|\\<log\\>\\|\\<logBase\\>\\|\\<lookup\\>\\|\\<map\\>\\|\\<mapM\\>\\|\\<mapM_\\>\\|\\<max\\>\\|\\<maxBound\\>\\|\\<maximum\\>\\|\\<maybe\\>\\|\\<min\\>\\|\\<minBound\\>\\|\\<minimum\\>\\|\\<mod\\>\\|\\<negate\\>\\|\\<not\\>\\|\\<notElem\\>\\|\\<null\\>\\|\\<odd\\>\\|\\<or\\>\\|\\<otherwise\\>\\|\\<pi\\>\\|\\<pred\\>\\|\\<print\\>\\|\\<product\\>\\|\\<properFraction\\>\\|\\<putChar\\>\\|\\<putStr\\>\\|\\<putStrLn\\>\\|\\<quot\\>\\|\\<quotRem\\>\\|\\<read\\>\\|\\<readFile\\>\\|\\<readIO\\>\\|\\<readList\\>\\|\\<readLn\\>\\|\\<readParen\\>\\|\\<reads\\>\\|\\<readsPrec\\>\\|\\<realToFrac\\>\\|\\<recip\\>\\|\\<rem\\>\\|\\<repeat\\>\\|\\<replicate\\>\\|\\<return\\>\\|\\<reverse\\>\\|\\<round\\>\\|\\<scaleFloat\\>\\|\\<scanl\\>\\|\\<scanl1\\>\\|\\<scanr\\>\\|\\<scanr1\\>\\|\\<seq\\>\\|\\<sequence\\>\\|\\<sequence_\\>\\|\\<show\\>\\|\\<showChar\\>\\|\\<showList\\>\\|\\<showParen\\>\\|\\<showString\\>\\|\\<shows\\>\\|\\<showsPrec\\>\\|\\<significand\\>\\|\\<signum\\>\\|\\<sin\\>\\|\\<sinh\\>\\|\\<snd\\>\\|\\<span\\>\\|\\<splitAt\\>\\|\\<sqrt\\>\\|\\<subtract\\>\\|\\<succ\\>\\|\\<sum\\>\\|\\<tail\\>\\|\\<take\\>\\|\\<takeWhile\\>\\|\\<tan\\>\\|\\<tanh\\>\\|\\<toEnum\\>\\|\\<toInteger\\>\\|\\<toRational\\>\\|\\<truncate\\>\\|\\<uncurry\\>\\|\\<undefined\\>\\|\\<unlines\\>\\|\\<until\\>\\|\\<unwords\\>\\|\\<unzip\\>\\|\\<unzip3\\>\\|\\<userError\\>\\|\\<words\\>\\|\\<writeFile\\>\\|\\<zip\\>\\|\\<zip3\\>\\|\\<zipWith\\>\\|\\<zipWith3\\>\\)'"
execute "syntax match vimshellFunction '\\(".s:hsprompt.".*\\)\\@<=\\(\\<foldl1\\>\\|\\<foldr1\\>\\|\\<mapM\\>\\|\\<mapM_\\>\\|\\<sequence_\\>\\|\\<showChar\\>\\|\\<showList\\>\\|\\<showParen\\>\\|\\<showString\\>\\|\\<shows\\>\\|\\<showsPrec\\>\\|\\<sinh\\>\\|\\<tanh\\>\\|\\<cosh\\>\\|\\<concatMap\\>\\|\\<divMod\\>\\|\\<atan2\\>\\|\\<atanh\\>\\|\\<acosh\\>\\|\\<zip3\\>\\|\\<zipWith\\>\\|\\<zipWith3\\>\\|\\<dropWhile\\>\\|\\<takeWhile\\>\\)'"
syntax match vimshellOperator '\(\(+\|-\|/\|*\|!\|&\||\|>\|<\|=\|::\|\^\|\$\)\+\|()\)'
syntax match vimshellComment '-- .*$'
syntax match vimshellLambda '\\'
highlight default link vimshellStatement Statement
highlight default link vimshellPyStatement Statement
highlight default link vimshellConditional Conditional
highlight default link vimshellString String
highlight default link vimshellCharacter Character
highlight default link vimshellBoolean Boolean
highlight default link vimshellOperator Operator
highlight default link vimshellLambda Function
highlight default link vimshellFunction Function
highlight default link vimshellComment Comment
highlight default link vimshellType Type
highlight default link vimshellCompilername Type
highlight default link vimshellCompilerdescription Constant

syntax match vimshellAble '^[d-]\([r-][w-][x-]\)\([r-][w-][x-]\)*[+@]*'
highlight default link vimshellAble Float

" rewriting default setting
syntax region vimshellError start=+!!!+ end=+!!!+ contains=vimshellErrorHidden oneline
syntax match vimshellError '^.*parse error.*$'
highlight default link vimshellError Error
syntax match vimshellUserPrompt_ '^\[%\] .*$' contains=vimshellUserPromptHidden
highlight default link vimshellUserPrompt_ Identifier

syntax match vimshellConstants_ '[+-]\=\<\d\+\>'
syntax match vimshellConstants_ '[+-]\=\<0x\x\+\>'
syntax match vimshellConstants_ '[+-]\=\<0\o\+\>'
syntax match vimshellConstants_ '[+-]\=\d\+#[-+]\=\w\+\>'
syntax match vimshellConstants_ '[+-]\=\d\+\.\d\+\([eE][+-]\?\d\+\)\?\>'
highlight default link vimshellConstants_ Float
syntax match vimshellTime '\<\d\+\>:\<\d\+\>'
syntax match vimshellTime '\<\d\+\>:\<\d\+\>:\<\d\+\>'
syntax match vimshellTime '\<\d\+\>\.\<\d\+\>\.\<\d\+\>'
syntax match vimshellDate '\<\d\+-\d\+-\d\+\>'

syntax match vimshellURL /\(https\?\|ftp\):\/\/[0-9A-Za-z][&:()\[\]{}#@~%_\-=?/.0-9A-Za-z]*[0-9A-Za-z]\(:\d\d*\/\?\)\?\/?/
highlight default link vimshellURL Underlined

" diff
" /opt/local/share/vim/vim73/syntax
syntax match diffRemoved "^-.*"
syntax match diffRemoved "^<.*"
syntax match diffAdded "^+.*"
syntax match diffAdded "^>.*"
syntax match diffChanged "^! .*"
syntax match diffSubname " @@..*"ms=s+3 contained
syntax match diffLine "^@.*" contains=diffSubname
syntax match diffLine "^\<\d\+\>.*"
syntax match diffLine "^\*\*\*\*.*"
syntax match diffLine "^---$"
"Some versions of diff have lines like "#c#" and "#d#" (where # is a number)
syntax match diffLine "^\d\+\(,\d\+\)\=[cda]\d\+\>.*"
syntax match diffFile "^diff.*"
syntax match diffFile "^+++ .*"
syntax match diffFile "^Index: .*$"
syntax match diffFile "^==== .*$"
syntax match diffOldFile "^\*\*\* .*"
syntax match diffNewFile "^--- .*"
syntax match diffComment "^#.*"
highlight default link diffOldFile diffFile
highlight default link diffNewFile diffFile
highlight default link diffFile Type
highlight default link diffOnly Constant
highlight default link diffIdentical Constant
highlight default link diffDiffer Constant
highlight default link diffBDiffer Constant
highlight default link diffIsA Constant
highlight default link diffNoEOL Constant
highlight default link diffCommon Constant
highlight default link diffRemoved Special
highlight default link diffChanged PreProc
highlight default link diffAdded Constant
highlight default link diffLine Statement
highlight default link diffSubname PreProc
highlight default link diffComment Comment

" MPlayer
syntax match mplayerPlayingFileName '\(Playing \)\@<=.*\(\.\)\@='
syntax match mplayerTag '\( *Title:\| *Artist:\| *Album:\| *Year:\| *Comment:\| *Track:\| *Genre:\| *Opening audio decoder:\| *AUDIO:\| *Selected audio codec:\| *AO:\| *Video:\| *Clip info:\| *Opening video decoder:\| *Selected video codec:\| *VIDEO:\|\[lavf\] stream \d*:\|VO:\|Opening video filter:\|Movie-Aspect is [^:]*:\| *major_brand:\| *minor_version:\| *compatible_brands:\| *creation_time:\| *copyright:\| *copyright-eng:\|Audio:\)\@<=\(.*\)$'
syntax match mplayerTagName '^!*\( *Title\| *Artist\| *Album\| *Year\| *Comment\| *Track\| *Genre\| *Opening audio decoder\| *AUDIO\| *Selected audio codec\| *AO\| *Video\| *Clip info\| *Opening video decoder\| *Selected video codec\| *VIDEO\|\[lavf\] stream \d*\|VO\|Opening video filter:\|Movie-Aspect is [^:]*\| *major_brand\| *minor_version\| *compatible_brands\| *creation_time\| *copyright\| *copyright-eng\|Audio\)'


" Python
syntax match vimshellPyPrompt '>>>'


let b:current_syntax = 'vimshell'
