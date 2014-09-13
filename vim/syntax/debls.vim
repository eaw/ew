" Vim syntax file
" Language:     debls
" Maintainer:   Erik Warendorph <erik.warendorph@mail.com>
" Last Change:  2001 Mar 19
" file: debls.vim
" date: 2001-03-19..2001-03-19

syn clear

syn match deblsTrailWS         /\s\+$/
syn match deblsHeading         /^[^ ]*:/
syn match deblsMark            / [^a-zA-Z0-9 ]/ 
syn match deblsManMarked       / [^-a-zA-Z0-9 ] \=\S\+/lc=2
syn match deblsStdInstalled    / [#] \=\S\+/lc=2
syn match deblsStdUninstalled  / [%] \=\S\+/lc=2
syn match deblsOptInstalled    / [*] \=\S\+/lc=2

hi      deblsTrailWS        ctermbg=Red guibg=Red
hi link deblsHeading        Comment
hi link deblsMark           PreProc
hi link deblsManMarked      Statement
hi link deblsStdInstalled   Identifier
hi link deblsStdUninstalled Constant
hi link deblsOptInstalled   Type

