" Vim syntax file
" Language:     ascii text files
" Maintainer:   Erik Warendorph <erik.warendorph@mail.com>
" Last Change:  2001 Mar 19
" file: txt.vim
" date: 2001-03-15..2001-03-16..2001-03-17..2001-03-19

syn clear

syn match   txtTrailWS  /\s\+$/
syn match   txtOperator /[-+*]/
syn match   txtMail     /<\=[^< 	]\+@[^> 	]\+>\=/
syn match   txtURL      /[a-zA-Z]\+:[^ ]\+[\/-a-zA-Z0-9]_/
syn match   txtFile     /\S\+\.\S*[-\/a-zA-Z0-9_]/
syn match   txtNumber   /\d\+\(\.\d\+\)*/
syn match   txtVerNumber  /\<v\=\d\+\(\.\d\+\)*/
syn match   txtHeading  /^.\{,40\}:\s*$/ contains=txtTrailWS,txtNumber,txtOperator,txtMail,txtURL
syn match   txtComment  /^\s*#.*/ contains=txtTrailWS

hi      txtTrailWS  ctermbg=Red guibg=Red
hi link txtNumber   Constant
hi link txtVerNumber  Constant
hi link txtOperator PreProc
hi link txtMail     Statement
hi link txtURL      Type
hi link txtFile     Type
hi link txtHeading  Identifier
hi link txtComment  Comment

