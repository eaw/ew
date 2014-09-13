" Vim syntax file
" Language:     debian packages file
" Maintainer:   Erik Warendorph <erik.warendorph@mail.com>
" Last Change:  2001 Apr 06
"
" debian packages file
"
" file:   debpkg.vim
" date:   2001-03-12..2001-03-13..2001-04-06
" author: [ew] erik warendorph
"

syn clear

syn match debpkgFldOnly /^[^ :]\+:$/

syn match debpkgFld    /^[^ :]\+:/he=e-0     contained
syn match debpkgVal    /:.\+$/lc=1           contained
syn match debpkgFV     /^[^ :]\+:.\+$/       contains=debpkgFld,debpkgVal
"
syn match debpkgPkgFld /^Package:/he=e-0     contained
syn match debpkgPkgVal /: .\+$/lc=2          contained
syn match debpkgPkgFV  /^Package: .\+$/      contains=debpkgPkgFld,debpkgPkgVal
"
syn match debpkgDscFld /^Description:/he=e-0 contained
syn match debpkgDscVal /: .\+$/lc=1          contained
syn match debpkgDscFV  /^Description: .\+$/  contains=debpkgDscFld,debpkgDscVal
"
syn match debpkgSecFld /^Section:/he=e-0     contained
syn match debpkgSecVal /: .\+$/lc=2          contained
syn match debpkgSecFV  /^Section: .\+$/      contains=debpkgSecFld,debpkgSecVal
"
syn match debpkgPriFld /^Priority:/he=e-0    contained
syn match debpkgPriVal /: .\+$/lc=1          contained
syn match debpkgPriFV  /^Priority: .\+$/     contains=debpkgPriFld,debpkgPriVal
"
"syn match debpkgLongDesc /^ .*$/

hi link debpkgFldOnly  Identifier
hi link debpkgFld      Identifier
hi link debpkgVal      Constant
hi link debpkgPkgFld   Type
hi link debpkgPkgVal   Statement
hi link debpkgDscFld   Identifier
hi link debpkgDscVal   PreProc
hi link debpkgSecFld   Identifier
hi link debpkgSecVal   Comment
hi link debpkgPriFld   Identifier
hi link debpkgPriVal   Comment

"if &background == "dark"
"  hi debpkgFld  ctermbg=darkred  guibg=#500000
"  hi debpkgVal ctermbg=darkblue guibg=#000050
"  "hi debpkgLongDesc cterm=NONE
"else
"  hi debpkgFld  ctermbg=lightred  guibg=#ffd0d0
"  hi debpkgVal ctermbg=lightblue guibg=#d0d0ff
"  "hi debpkgLongDesc cterm=NONE
"endif

