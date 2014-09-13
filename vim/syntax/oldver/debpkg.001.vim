" Vim syntax file
" Language:     debian packages file
" Maintainer:   Erik Warendorph <erik.warendorph@mail.com>
" Last Change:  2001 Mar 13
"
" debian packages file
"
" file:   debpkg.vim
" date:   2001-03-12..2001-03-13
" author: [ew] erik warendorph
"

syn clear

syn match debpkgNameOnly /^[^ :]\+:$/

syn match debpkgName   /^[^ :]\+:/he=e-0     contained
syn match debpkgValue  /:.\+$/lc=1           contained
syn match debpkgNV     /^[^ :]\+:.\+$/       contains=debpkgName,debpkgValue
"
syn match debpkgPName  /^Package:/he=e-0     contained
syn match debpkgPValue /: .\+$/lc=2          contained
syn match debpkgPNV    /^Package: .\+$/      contains=debpkgPName,debpkgPValue
"
syn match debpkgDName  /^Description:/he=e-0 contained
syn match debpkgDValue /: .\+$/lc=1          contained
syn match debpkgDNV    /^Description: .\+$/  contains=debpkgDName,debpkgDValue
"
"syn match debpkgLongDesc /^ .*$/

hi link debpkgNameOnly   Type
hi link debpkgName       Type
hi link debpkgValue      Constant
"hi link debpkgPName      Visual
hi link debpkgPName      Statement
hi link debpkgPValue     Error
hi link debpkgDName      Identifier
hi link debpkgDValue     Special

"if &background == "dark"
"  hi debpkgName  ctermbg=darkred  guibg=#500000
"  hi debpkgValue ctermbg=darkblue guibg=#000050
"  "hi debpkgLongDesc cterm=NONE
"else
"  hi debpkgName  ctermbg=lightred  guibg=#ffd0d0
"  hi debpkgValue ctermbg=lightblue guibg=#d0d0ff
"  "hi debpkgLongDesc cterm=NONE
"endif

