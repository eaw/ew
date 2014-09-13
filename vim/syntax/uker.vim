"
" syntax file for uker.txt
" 2001-03-13 [ew]
"

syn clear

syn match ukerYear /^\d\d\d\d ======$/
syn match ukerWeek /^= uke \d\d === .*$/
syn match ukerDay  /^\d\d\d\d-\d\d-\d\d .*$/
syn match ukerTimeLine0 /^  [0-9.?]\{2\}:[0-9.?]\{2\}\s\s*[{}]/he=e-1
syn match ukerTimeLine /^  [0-9.?]\{2\}:[0-9.?]\{2\}-[0-9.?]\{2\}:[0-9.?]\{2\} [0-9.?]\.[0-9.?]\{1,2\}/
syn match ukerCompany /[0-9.?] [a-z][^ ]*:/lc=2
syn match ukerPrivate /#.*/
syn match ukerCursor /^>>$/

" XXX: Comment, Constant, Special, Identifier, Statement, PreProc, Type,
" XXX: Ignore, Error, Todo
"
hi link ukerYear      Type
hi link ukerWeek      Type
hi link ukerDay       Statement
hi link ukerTimeLine0 Constant
hi link ukerTimeLine  PreProc
hi link ukerCompany   Constant
hi link ukerPrivate   Comment
hi link ukerCursor    Error  " Todo or Error

