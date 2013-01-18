
" prompt, error
syntax match vimshellUserPrompt '^\[%\] .*$' contains=vimshellUserPromptHidden
execute 'syntax match vimshellPrompt' string('^' . vimshell#escape_match(vimshell#get_prompt()))
execute 'syntax match vimshellSecondPrompt' string('^' . vimshell#escape_match(vimshell#get_secondary_prompt()))
if has('conceal')
  syntax match vimshellErrorHidden '!!!' contained conceal
  syntax match vimshellUserPromptHidden '^\[%\] ' contained conceal
else
  syntax match vimshellErrorHidden '!!!' contained
  syntax match vimshellUserPromptHidden '^\[%\] ' contained
endif
highlight default link vimshellUserPrompt Identifier
highlight default link vimshellPrompt Identifier
highlight default link vimshellSecondPrompt Function
highlight default link vimshellUserPromptHidden Ignore
highlight default link vimshellError Error
highlight default link vimshellErrorHidden Ignore

" special
syntax match vimshellSpecial '[|<>;&;]' contained
highlight default link vimshellSpecial Special

" string
syntax match vimshellStringSpecial '\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)' contains=vimshellFunction contained
syntax region vimshellString start=+"+ end=+"+ contains=vimshellStringSpecial oneline contained
syntax region vimshellString start=+'+ end=+'+ contains=vimshellStringSpecial oneline contained
syntax region vimshellString start=+`+ end=+'+ contains=vimshellStringSpecial,haskellFunction,haskellType oneline
syntax region vimshellString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
highlight default link vimshellStringSpecial SpecialChar
highlight default link vimshellString String

" shell
syntax match vimshellArguments '\s-\=-[[:alnum:]-]\+=\=' contained
execute "syntax region vimshellExe start=".string('^'.vimshell#escape_match(vimshell#get_prompt()))
 \ "end='[^[:blank:]]\\+\\zs[[:blank:]\\n]' contained contains=vimshellPrompt,".
 \ "vimshellSpecial,vimshellConstants,vimshellArguments,vimshellString,vimshellComment"
syntax match vimshellExe '[|;]\s*\f\+' contained contains=vimshellSpecial,vimshellArguments
highlight default link vimshellArguments Type
highlight default link vimShellExe Statement
syntax match vimshellVariable '$\h\w*' contained
syntax match vimshellVariable '$$\h\w*' contained
syntax region vimshellVariable start=+${+ end=+}+ contained
highlight default link vimshellVariable Identifier
syntax match vimshellLinkTo '\(\(^\|\s\)[[:alnum:]_.][[:alnum:]_.-]\+@ ->\)\@<=\s\+\(\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\|.\)\/\?\)\+'
highlight default link vimshellLinkTo String
syntax match vimshellPath '\(^\|\s\)\(\/\|\.\.\?\)\?\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\/\)\+\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\|.\)\?'
syntax match vimshellPath '\(\/\|\.\.\?\)\(\([[:alpha:]_.][[:alnum:]_.-]*\)\/\)\+\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\|.\)\?'
syntax match vimshellPath '[[:alnum:]]\@<!\.\?\/\([a-z][[:alnum:]_-]*\)\.\([a-z]*[[:alnum:]_-]\+\)'
highlight default link vimshellPath Constant
syntax match vimshellDirectory '\%(\f\s\?\)\+/\ze\%(\s\|$\)'
highlight default link vimshellDirectory Preproc
syntax match vimshellLink '\(^\|\s\)[[:alnum:]_.][[:alnum:]_.-]\+@'
highlight default link vimshellLink Character
syntax match vimshellDotFiles '\%(^\|\s\)\.[[:alnum:]_.-]\+[[:blank:]\n]'
highlight default link vimshellDotFiles Comment
syntax keyword vimshellCommand ls cp df expr launchctl mkdir pwd sh tcsh zsh bash sh
syntax keyword vimshellCommand csh domainname hostname link mv rcp sleep test cat 
syntax keyword vimshellCommand date echo kill ln pax rm stty unlink chmod dd ed ksh 
syntax keyword vimshellCommand ps rmdir sync mount_acfs SystemStarter shutdown mknod 
syntax keyword vimshellCommand mount_smbfs nologin autodiskmount reboot halt dmesg 
syntax keyword vimshellCommand fsck_cs dynamic_pager launchd fibreconfig mount_afp 
syntax keyword vimshellCommand mount_webdav newfs_udf mount_udf md5 fsck_udf rtsol 
syntax keyword vimshellCommand mount_ntfs ipfw ping6 route ip6fw ifconfig ping mount_msdos 
syntax keyword vimshellCommand fsck_msdos newfs_msdos kextunload kextload newfs_hfs 
syntax keyword vimshellCommand umount mount_exfat disklabel newfs_exfat quotacheck 
syntax keyword vimshellCommand fsck_exfat mount mount_fdesc mount_ftp mount_hfs fstyp_udf 
syntax keyword vimshellCommand fstyp_ntfs fstyp_msdos fstyp_hfs fstyp fsck_hfs fsck 
syntax keyword vimshellCommand mount_devfs mount_cd9660 mount_cddafs emond pfctl 
syntax keyword vimshellCommand nfsiod mount_nfs nfsd mpioutil cabal happy gcc gzip 
syntax keyword vimshellCommand tar make openssl whois awk ghc ghci runhaskell vim 
syntax keyword vimshellCommand python perl git ruby irb mplayer ps2pdf pdf2ps latex 
syntax keyword vimshellCommand platex pdflatex pdfetex pdftex nop texe less iexe 
syntax keyword vimshellCommand cd view vexe time sudo ssh source_shellcmd source 
syntax keyword vimshellCommand shell sexe scp repeat popd open mkcd let history histdel 
syntax keyword vimshellCommand gexe gendoc gcd galias exit exe eval dirs alias whereis 
syntax keyword vimshellCommand vimsh vimdiff build which clear bg wget vi wc curl
highlight default link vimshellCommand Function
syntax keyword vimshellGitHubCommands add bisect branch checkout clone commit diff fetch grep init log merge pull push rebase reset show status tag
highlight default link vimshellGitHubCommands Constant

" Programming language
syntax keyword vimshellBoolean True False true false
highlight default link vimshellConditional Conditional
highlight default link vimshellCompilername Type
highlight default link vimshellCompilerdescription Constant
highlight default link vimshellStatement Statement
highlight default link vimshellBoolean Boolean
highlight default link vimshellStatement Statement
highlight default link vimshellPyStatement Statement
highlight default link vimshellCharacter Character
highlight default link vimshellOperator Operator
highlight default link vimshellFunction Function
highlight default link vimshellComment Comment
highlight default link vimshellType Type

" GHCi
let s:hsprompt='^Prelude[^>]*>'
syntax match vimshellOperator ' \(+\|-\|/\|*\|!\|&\||\|>\|<\|=\|\^\|\$\)\{1,3} \|()\|::'
syntax match vimshellOperator '(\(:\|+\|-\|/\|*\|!\|&\||\|>\|<\|=\|\^\|\$\|\.\)\{1,3})'
execute "syntax match vimshellHsPrompt '".s:hsprompt."'"
highlight default link vimshellHsPrompt vimshellPrompt
command -nargs=1 HsCommand execute 'syntax match vimshellHsCommand ' string(s:hsprompt.' *:'.<args>) ' contains=vimshellHsPrompt oneline'
HsCommand '\<\(add\|cmd\|def\|run\|set\)\>'
HsCommand '\<\(back\|edit\|help\|info\|kind\|list\|load\|main\|quit\|show\|type\)\>'
HsCommand '\<\(break\|ctags\|etags\|force\|print\|trace\|undef\|unset\)\>'
HsCommand '\<\(browse\|\|delete\|reload\|sprint\|abandon\|forward\|history\|continue\|steplocal\|stepmodule\)\>'
delcommand HsCommand
highlight default link vimshellHsCommand vimshellExe
syntax match vimshellHsLoading '^Loading package '
highlight default link vimshellHsLoading Constant
syntax match vimshellHsLoading '\(^Loading package .*\)\@<=\.\.\.[^.]*\.\.\.[^.]*\.$'
syntax match vimshellHsLoadingPackage '^Loading package .*' contains=vimshellHsLoading
highlight default link vimshellHsLoadingPackage Special
syntax region vimshellCompilername start=+^GHCi, version \d\+\.\d\+\.\d\++ end=+$+ contains=vimshellURL
syntax region vimshellCompilername start=+^The Glorious Glasgow Haskell Compilation System+ end=+$+
execute 'syntax match vimshellError ' string('\('.s:hsprompt.'.*\)\@<=\<let\>\(\s\+[^=]\+=\s*\S\+\)\@!')
execute 'syntax match vimshellStatement ' string('\('.s:hsprompt.'.*\<let\>\s\+[^=]\+=\s*.\+\)\@<=\<in\>\|\('.s:hsprompt.'.*\)\@<=\<let\>\(\s\+[^=]\+=\s*\S\+\)\@=') 'contains=vimshellNumber,vimshellString'
execute 'syntax match vimshellError ' string('\('.s:hsprompt.'.*\)\@<=\(\<if\>\(.*\<then\>.*\<else\>\)\@!\|\(\<if\>.*\)\@<=\<then\>\(.*\<else\>\)\@!\|\(\<if\>.*\)\@<!\<then\>\(.*\<else\>\)\@=\|\(\<if\>.*\<then\>.*\)\@<!\<else\>\)')
syntax match vimshellConditional '\(\<if\>\(.*\<then\>.*\<else\>\)\@=\|\(\<if\>.*\)\@<=\<then\>\(.*\<else\>\)\@=\|\(\<if\>.*\<then\>.*\)\@<=\<else\>\)'
syntax keyword haskellType Bool Bounded Char Double Either Enum Eq FilePath Float Floating Fractional Functor IO IOError Int Integer Integral Maybe Monad Num Ord Ordering Rational Read ReadS Real RealFloat RealFrac Show ShowS String GHC Classes Base Tuple Types Type Data
highlight default link haskellType vimshellType
syntax keyword haskellFunction and any or head last all show print not break map read null length reads even error words fail zip take until lines repeat return compare filter
syntax keyword haskellFunction abs acos appendFile asTypeOf asin asinh atan catch ceiling concat const cos cosh curry cycle decodeFloat div drop either elem encodeFloat enumFrom enumFromThen enumFromThenTo enumFromTo exp exponent flip floatDigits floatRadix floatRange floor fmap foldl foldr fromEnum fromInteger fromIntegral return map
syntax keyword haskellFunction fromRational fst gcd getChar getContents getLine id interact ioError isDenormalized isIEEE isInfinite isNaN isNegativeZero iterate lcm lex logBase lookup max maybe min mod negate notElem odd otherwise pi pred product
syntax keyword haskellFunction properFraction putChar putStr putStrLn quot quotRem realToFrac recip rem replicate reverse round scaleFloat scanl scanl1 scanr scanr1 seq sequence significand signum sin snd span splitAt sqrt subtract succ sum tail tan toEnum toInteger toRational truncate uncurry undefined unlines unwords unzip unzip3 userError writeFile
syntax keyword haskellFunction foldl1 maxBound maximum foldr1 mapM mapM_ sequence_ showChar showList showParen showString shows showsPrec sinh tanh cosh concatMap divMod atan2 atanh acosh zip3 zipWith zipWith3 dropWhile takeWhile readFile readIO readList readLn readParen minBound minimum readsPrec
syntax keyword haskellFunction nubBy deleteBy deleteFirstsBy unionBy intersectBy groupBy sortBy insertBy maximumBy minimumBy genericLength genericTake genericDrop genericSplitAt genericIndex genericReplicate
highlight default link haskellFunction vimshellFunction
execute 'syntax match vimshellComment ' string('--.*\(Defined in\)') ' oneline contains=vimshellString,vimshellURL,haskellType'
syntax region vimshellError start=+^\*\*\* + end=+$+ contains=vimshellErrorHidden oneline
if has('conceal')
  syntax match vimshellErrorHidden '^\*\*\*' contained conceal
else
  syntax match vimshellErrorHidden '^\*\*\* ' contained
endif
syntax region vimshellError start=+parse error+ end=+$+ oneline

" Python
syntax match vimshellPyPrompt '^>>>'
highlight default link vimshellPyPrompt vimshellPrompt
syntax region vimshellError start=+^SyntaxError+ end=+$+ oneline
syntax region vimshellError start=+^Traceback+ end=+given)+
syntax region vimshellCompilername start=+^Python \d\+\.\d\+\.\d\++ end=+$+ oneline
syntax region vimshellCompilerdescription start=+^Python \d\+.\d\+.\d\++ end=+for more information\.+ contains=vimshellCompilername
syntax match vimshellError '\<lambda\>\(\(\s\+\(\h\w*\)\?\)\?:\)\@!'
syntax match vimshellStatement '\<lambda\>\(\(\s\+\(\h\w*\)\?\)\?:\)\@='
syntax match vimshellConditional '\(\<if\>\(.*\<else\>\)\@=\|\(\<if\>.*\)\@<=\<else\>\)'
syntax match vimshellError '\<def\>\(\s\+\h\w*(.*).*:\)\@!'
syntax match vimshellStatement '\<def\>\(\s\+\h\w*\s*(.*).*:\)\@='

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

" GitHub
syntax region vimshellCompilername start=+^git version \d\+\.\d\+\.\d\+.*+ end=+$+ oneline
syntax match vimshellGitBranch '^\[\a\+ \w\+\]'
highlight default link vimshellGitBranch Special

" diff
syntax region vimshellDiffNewFile start=+^-\(-->\)\@!+ end=+$+ oneline
syntax region vimshellDiffNewFile start=+^---[^>]+ end=+$+ oneline
syntax region vimshellDiffNewFile start=+^> + end=+$+ oneline
highlight default link vimshellDiffNewFile Type
syntax region vimshellDiffFile start=/^+/ end=+$+ oneline
syntax region vimshellDiffFile start=/^< / end=+$+ oneline
syntax region vimshellDiffFile start=/^+++/ end=+$+ oneline
highlight default link vimshellDiffFile PreCondit
syntax region vimshellDiffLine start=+^@@+ end=+$+ oneline
highlight default link vimshellDiffLine Special
syntax match vimshellDiffLine '^\d\+\(,\d\+\)\=[cda]\d\+\>\(,\d\+\)\=$'
highlight default link gitCommand Function

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
syntax match mplayerPlayingFileName '\(Playing \)\@<=.*\(\.\)\@='

" LaTeX
syntax match vimshellError '^.*[Ee]rror.*'
syntax match vimshellError '^.*[Ww]arning.*'
syntax match vimshellError '^.*ERROR.*'
syntax match vimshellError '^.*WARNING.*'
syntax match vimshellError '^.*I found no.*'
syntax match vimshellError "^.*I can't.*"
syntax match vimshellError '^.*Overfull.*'
syntax match vimshellError '^!.*'

" post setting
syntax region vimshellError start=+!!!+ end=+!!!+ contains=vimshellErrorHidden oneline
syntax match vimshellTag '<[0-9A-Za-z_-]*>'
highlight default link vimshellTag Constant
syntax match vimshellPermission '^[bcdlsp-][r-][w-][xsStT-][r-][w-][xsStT-][r-][w-][xsStT-][@+]\?'
highlight default link vimshellPermission Special
syntax match vimshellFunction '\\\(.*->\)\@=\|\(\\.*\)\@<=->'
syntax match vimshellPath '\(^\|\s\)\(\/\|\.\.\?\)\?\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\/\)\+\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\)\?'
syntax match vimshellPath '\(\/\|\.\.\?\)\(\([[:alpha:]_.][[:alnum:]_.-]*\)\/\)\+\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\|.\)\?'
syntax match vimshellPath '[[:alnum:]]\@<!\.\?\/\([a-z][[:alnum:]_-]*\)\.\([a-z]*[[:alnum:]_-]\+\)'
syntax match vimshellLinkTo '\(\(^\|\s\)[[:alnum:]_.][[:alnum:]_.-]\+@ ->\)\@<=\s\+\(\(\([[:alnum:]_.][[:alnum:]_.-]\+\)\|.\)\/\?\)\+'
execute 'syntax match vimshellPrompt' string('^' . vimshell#escape_match(vimshell#get_prompt()))
execute 'syntax match vimshellSecondPrompt' string('^' . vimshell#escape_match(vimshell#get_secondary_prompt()))

" string
syntax match vimshellStringSpecial '\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)' contains=vimshellFunction contained
syntax region vimshellString start=+"+ end=+"+ contains=vimshellStringSpecial oneline contained
syntax region vimshellString start=+'+ end=+'+ contains=vimshellStringSpecial oneline contained
syntax region vimshellString start=+"+ end=+"+ contains=vimshellStringSpecial oneline
syntax region vimshellString start=+'+ end=+'+ contains=vimshellStringSpecial oneline
syntax region vimshellString start=+`+ end=+'+ contains=vimshellStringSpecial,haskellFunction,haskellType oneline
syntax region vimshellString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
highlight default link vimshellStringSpecial SpecialChar
highlight default link vimshellString String

" number, time, date
highlight default link vimshellNumber Number
highlight default link vimshellFloat Float
syntax match vimshellNumber '[+-]\=\<\d\+\>\|[+-]\=\<0[xX]\x\+\>\|[+-]\=\<0[oO]\o\+\>'
syntax match vimshellFloat '\<[+-]\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\?\>'
syntax match vimshellTime '\<\d\d\=:\d\d\=\>'
syntax match vimshellTime '\<\d\d\=:\d\d\=:\d\d\=\>'
syntax match vimshellDate '\<\d\+-\d\d\=-\d\+\>'
syntax match vimshellDate '\<\d\+/\d\d\=/\d\+\>'
highlight default link vimshellTime Time
highlight default link vimshellDate Date

let b:current_syntax = 'vimshell'
