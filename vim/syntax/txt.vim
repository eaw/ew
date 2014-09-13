" Vim syntax file
" Language:     text/plain files
" Maintainer:   Erik Warendorph <erik@warendorph.org>
" Last Change:  2007 Jun 16
" file:    txt.vim
" version: v0.05
" date:    2001-03-15..2001-03-16..2001-03-17..2001-03-19..2003-04-09..
"          2003-04-10..2003-08-26..2007-06-04..2007-06-16

syn clear

syn match   txtTab      /\t/
syn match   txtTrailTab /\t\([ \x0b\x0c\x0d\t]*$\)\@=/
syn match   txtTrailWS  /[ \x0b\x0c\x0d]\([ \x0b\x0c\x0d\t]*$\)\@=/
"syn match   txtTrailWS  /\s\+$/
syn match   txtOperator /[-+*]/
syn match   txtNumber   /\d\+\(\.\d\+\)*/
"syn match   txtFile     /[^ \t'"@]*[/][^ \t'"@]*[-/a-zA-Z0-9_]/
"syn match   txtFile     /[^ \t'"@]*[-/a-zA-Z0-9_][/]/
"syn match   txtFile     /[^ \t'"@]*[/.][^ \t'"@]*[a-zA-Z][^ \t'"@]*[-/a-zA-Z0-9_]/
"syn match   txtFile     /[^ \t'"@]*[a-zA-Z][^ \t'"@]*[/.][^ \t'"@]*[-/a-zA-Z0-9_]/
" XXX fix txtFile
syn match   txtFile     /\([~][/]\|[./]\)\=[-a-zA-Z0-9_]\+\([./][-a-zA-Z0-9_]\+\)\+[/]\=/
syn match   txtURL      /<\=[a-zA-Z]\+:[^ \t]\+[-/a-zA-Z0-9_]>\=/
"syn match   txtMail     /<\=[^< \t]\+@[^> \t]\+>\=/
syn match   txtMail     /<\=[.A-Za-z0-9!#$%&'*+-/=?^_`{|}~]\+@[.A-Za-z0-9!#$%&'*+-/=?^_`{|}~]\+>\=/
syn match   txtVerNumber  /\<v\d\+\(\.\d\+\)*/
syn match   txtQuoted   /\(\\\)\@<!"\(\\.\|[^"\\]\)*"/ contains=txtTab,txtFile,txtURL,txtMail
syn match   txtQuoted   /\(\\\)\@<!'\(\\.\|[^'\\]\)*'/ contains=txtTab,txtFile,txtURL,txtMail
"syn match   txtHeading  /^.\{,40\}:\s*$/ contains=txtTrailWS,txtNumber,txtOperator,txtMail,txtURL
"syn match txtHeading /\(^-\{3,}\n\|^-\( -\)\{2,}\n\)\@<=\(^.*$\)/ contains=txtTab,txtTrailTab,txtTrailWS
syn match txtHeading1 /\(^-\{3,}\n\)\@<=\(^.*$\)/ contains=txtTab,txtTrailTab,txtTrailWS
syn match txtHeading2 /\(^-\( -\)\{2,}\n\)\@<=\(^.*$\)/ contains=txtTab,txtTrailTab,txtTrailWS
syn match   txtComment  /^\s*#.*/ contains=txtTab,txtTrailTab,txtTrailWS

hi      txtTab        ctermbg=Blue guibg=Blue
hi      txtTrailTab   ctermbg=Magenta guibg=Magenta
hi      txtTrailWS    ctermbg=Red guibg=Red
hi link txtOperator   PreProc
hi link txtNumber     Constant
hi link txtVerNumber  Constant
hi link txtQuoted     Constant
hi link txtFile       Type
hi link txtURL        Identifier
hi link txtMail       Statement
"
hi      txtHeading  NONE
"hi link txtHeading  Identifier
"hi      txtHeading  ctermfg=DarkRed
"hi link txtHeading  Constant
"hi link txtHeading  Statement
hi      txtHeading1  ctermfg=DarkBlue ctermbg=Cyan
hi      txtHeading2  ctermfg=DarkBlue ctermbg=White
"
hi link txtComment  Comment

