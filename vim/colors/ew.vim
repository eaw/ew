" Vim color file
" File:         colors/ew.vim
" Maintainer:   Erik Warendorph <erik.warendorph@start.no>
" Last Change:  2003-02-01
" Created:      2003-02-01

" based on: cterm-colors.vim 2001-03-15 [ew]

" first remove all existing highlighting
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "ew"

hi Normal cterm=none ctermfg=LightGrey ctermbg=Black

" groups for syntax highlighting
hi Comment       cterm=none  ctermfg=LightBlue     ctermbg=none
hi Constant      cterm=none  ctermfg=LightRed      ctermbg=none
hi Special       cterm=none  ctermfg=White         ctermbg=none
hi Identifier    cterm=none  ctermfg=DarkCyan      ctermbg=none
hi Statement     cterm=none  ctermfg=Yellow        ctermbg=none
hi PreProc       cterm=none  ctermfg=LightMagenta  ctermbg=none
hi Type          cterm=none  ctermfg=LightGreen    ctermbg=none
"hi Underlined    cterm=underline  ctermfg=DarkMagenta  ctermbg=none
"hi Underlined    cterm=underline  ctermfg=LightBlue  ctermbg=none
hi Underlined    cterm=underline  ctermfg=Yellow  ctermbg=none
hi Ignore        cterm=none  ctermfg=DarkGrey      ctermbg=none
hi Error         cterm=none  ctermfg=White         ctermbg=DarkRed
hi Todo          cterm=none  ctermfg=Black         ctermbg=Brown

" groups used in the 'highlight' and 'guicursor' options default value
hi SpecialKey    cterm=none  ctermfg=LightBlue     ctermbg=none
hi NonText       cterm=none  ctermfg=LightBlue     ctermbg=none
"hi Directory     cterm=none  ctermfg=LightCyan     ctermbg=none
hi Directory     cterm=none  ctermfg=LightBlue     ctermbg=none
hi ErrorMsg      cterm=none  ctermfg=White         ctermbg=DarkRed
hi IncSearch     cterm=reverse  ctermfg=none       ctermbg=none
hi Search        cterm=none  ctermfg=Black         ctermbg=Green
"hi MoreMsg       cterm=none  ctermfg=DarkGreen     ctermbg=none
hi MoreMsg       cterm=none  ctermfg=LightGreen    ctermbg=none
"hi ModeMsg       cterm=bold  ctermfg=none          ctermbg=none
"hi ModeMsg       cterm=none  ctermfg=LightRed      ctermbg=none
hi ModeMsg       cterm=none  ctermfg=White         ctermbg=none
"hi LineNr        cterm=none  ctermfg=Brown
hi LineNr        cterm=none  ctermfg=Yellow        ctermbg=none
"hi Question      cterm=none  ctermfg=DarkGreen     ctermbg=none
hi Question      cterm=none  ctermfg=LightGreen    ctermbg=none
"hi StatusLine    cterm=none  ctermfg=Yellow        ctermbg=Red
hi StatusLine    cterm=none  ctermfg=LightCyan     ctermbg=Blue
hi StatusLineNC  cterm=reverse  ctermfg=none       ctermbg=none
hi VertSplit     cterm=reverse  ctermfg=none       ctermbg=none
"hi Title         cterm=none  ctermfg=DarkMagenta   ctermbg=none
hi Title         cterm=none  ctermfg=LightMagenta  ctermbg=none
hi Visual        cterm=reverse  ctermfg=none       ctermbg=none
hi VisualNOS     cterm=bold,underline  ctermfg=none  ctermbg=none
"hi WarningMsg    cterm=none  ctermfg=DarkRed       ctermbg=none
hi WarningMsg    cterm=none  ctermfg=LightRed      ctermbg=none
hi WildMenu      cterm=none  ctermfg=Black         ctermbg=Brown
"hi Folded        cterm=none  ctermfg=Blue          ctermbg=LightGrey
hi Folded        cterm=none  ctermfg=LightCyan     ctermbg=Black
"hi FoldColumn    cterm=none  ctermfg=Blue          ctermbg=LightGrey
hi FoldColumn    cterm=none  ctermfg=LightCyan     ctermbg=Black
hi DiffAdd       cterm=none  ctermfg=none          ctermbg=DarkBlue
"hi DiffAdd       cterm=none  ctermfg=White         ctermbg=DarkBlue
hi DiffChange    cterm=none  ctermfg=none          ctermbg=DarkMagenta
"hi DiffChange    cterm=none  ctermfg=White         ctermbg=DarkMagenta
"hi DiffDelete    cterm=none  ctermfg=LightBlue     ctermbg=Cyan
hi DiffDelete    cterm=none  ctermfg=DarkBlue      ctermbg=Cyan
hi DiffText      cterm=none  ctermfg=White         ctermbg=Red
hi Cursor        cterm=none  ctermfg=none          ctermbg=none
hi lCursor       cterm=none  ctermfg=none          ctermbg=none

