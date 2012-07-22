" Haskell
let s:hsprompt='Prelude[^>]*>'
execute "syntax match vimshellHsPrompt '".s:hsprompt."'"
highlight default link vimshellHsPrompt vimshellPrompt
execute "syntax match vimshellHsCommand '".s:hsprompt." *:$' contains=vimshellHsPrompt"
execute "syntax match vimshellHsCommand '".s:hsprompt." *:\\(a\\|b\\|c\\|d\\|e\\|f\\|h\\|i\\|k\\|l\\|m\\|p\\|q\\|r\\|s\\|t\\|u\\)' contains=vimshellHsPrompt"
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

" Python
syntax match vimshellPyPrompt '>>>'
highlight default link vimshellPyPrompt vimshellPrompt
syntax match vimshellError '^SyntaxError.*$'
syntax match vimshellCompilername '^Python \d*\.\d*\.\d* ([^)]*) *$'
syntax match vimshellCompilername '^Python \d*\.\d*\.\d*$'
syntax match vimshellCompilerdescription '^Python \d*.\d*.\d* ([^)]*).*\n\(.*\n\)*.*for more information.$' contains=vimshellCompilername

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




highlight default link vimshellTime Number
highlight default link vimshellDate Constant
highlight default link vimshellConstants Number
highlight default link vimshellError Error

highlight default link vimShellLink Constant
highlight default link vimShellExe Statement
highlight default link vimShellUserPrompt Function
highlight default link vimShellPrompt_ vimshellPrompt
highlight default link vimshellTypeArchive Archive

syntax keyword vimshellStatement do case of let in
syntax keyword vimshellConditional if then else
syntax keyword vimshellStatement lambda
syntax region vimshellString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syntax region vimshellString start=+`+ end=+"+ oneline
syntax region vimshellString start=+`+ end=+`+ oneline
syntax region vimshellString start=+`+ end=+'+ oneline
syntax match vimshellCharacter '\'.\''
syntax keyword vimshellType Bool Bounded Char Double Either Enum Eq FilePath Float Floating Fractional Functor IO IOError Int Integer Integral Maybe Monad Num Ord Ordering Rational Read ReadS Real RealFloat RealFrac Show ShowS String
syntax keyword vimshellBoolean True False true false
syntax keyword vimshellFunction abs acos acosh all and any appendFile asTypeOf asin asinh atan atan2 atanh break catch ceiling compare concat concatMap const cos cosh curry cycle decodeFloat div divMod drop dropWhile either elem encodeFloat enumFrom enumFromThen enumFromThenTo enumFromTo error even exp exponent fail filter flip floatDigits floatRadix floatRange floor fmap foldl foldl1 foldr foldr1 fromEnum fromInteger fromIntegral fromRational fst gcd getChar getContents getLine head id init interact ioError isDenormalized isIEEE isInfinite isNaN isNegativeZero iterate last lcm length lex lines log logBase lookup map mapM mapM_ max maxBound maximum maybe min minBound minimum mod negate not notElem null odd or otherwise pi pred print product properFraction putChar putStr putStrLn quot quotRem read readFile readIO readList readLn readParen reads readsPrec realToFrac recip rem repeat replicate return reverse round scaleFloat scanl scanl1 scanr scanr1 seq sequence sequence_ show showChar showList showParen showString shows showsPrec significand signum sin sinh snd span splitAt sqrt subtract succ sum tail take takeWhile tan tanh toEnum toInteger toRational truncate uncurry undefined unlines until unwords unzip unzip3 userError words writeFile zip zip3 zipWith zipWith3
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

