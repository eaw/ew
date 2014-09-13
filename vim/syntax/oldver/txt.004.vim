" Vim syntax file
" Language:     ascii text files
" Maintainer:   Erik Warendorph <erik@warendorph.org>
" Last Change:  2003 Aug 26
" file:    txt.vim
" version: v0.04
" date:    2001-03-15..2001-03-16..2001-03-17..2001-03-19..2003-04-09..
"          2003-04-10..2003-08-26..2007-06-04

syn clear

syn match   txtTrailWS  /\s\+$/
syn match   txtOperator /[-+*]/
syn match   txtNumber   /\d\+\(\.\d\+\)*/
syn match   txtFile     /\S*[/]\S*[-/a-zA-Z0-9_]/
syn match   txtFile     /\S*[-/a-zA-Z0-9_][/]/
syn match   txtFile     /\S*[/.]\S*[a-zA-Z]\S*[-/a-zA-Z0-9_]/
syn match   txtFile     /\S*[a-zA-Z]\S*[/.]\S*[-/a-zA-Z0-9_]/
syn match   txtURL      /<\=[a-zA-Z]\+:[^ 	]\+[-/a-zA-Z0-9_]>\=/
syn match   txtMail     /<\=[^< 	]\+@[^> 	]\+>\=/
syn match   txtVerNumber  /\<v\d\+\(\.\d\+\)*/
"syn match   txtHeading  /^.\{,40\}:\s*$/ contains=txtTrailWS,txtNumber,txtOperator,txtMail,txtURL
syn match txtHeading /\(^-\{3,}\n\|^-\( -\)\{2,}\n\)\@<=\(^.*$\)/
syn match   txtComment  /^\s*#.*/ contains=txtTrailWS

hi      txtTrailWS  ctermbg=Red guibg=Red
hi link txtOperator PreProc
hi link txtNumber   Constant
hi link txtVerNumber  Constant
hi link txtFile     Type
hi link txtURL      Identifier
hi link txtMail     Statement
"
hi      txtHeading  NONE
"hi link txtHeading  Identifier
"hi      txtHeading  ctermfg=DarkRed
"hi link txtHeading  Constant
"hi link txtHeading  Statement
hi      txtHeading  ctermfg=Yellow ctermbg=Red
"
hi link txtComment  Comment

