"==============================================================================
" BEGIN CURLY BRACE
"
" file:    bcurly.vim
" version: v0.02
" type:    vim script
" author:  Erik Warendorph <erik.warendorph@start.no> [ew]
" date(s): 2003-01-20..2003-01-20
"
" description:
"
"   - reimplementation of [[ and ]], allowing beginning curly brace anywhere
"
" notes:
"
"   - the new versions of [[ and ]] will work as long as the ending curly
"     brace is at the start of a line
"   - parts of this script were inspired by Piet Delport's findchar.vim
"     (reimplemtation of: f F t T ; ,) and Benji Fisher's tip about using
"     <C-U> in mappings and v:count1 in the functions to handle counts for
"     mappings
"
" bugs:
"
"   - since [[ and ]] now are implemented by doing ][ or [] followed by %, the
"     buffer might sometimes scroll unexpectedly
"   - the jumplist will contain too much, all the jumps inside the functions
"     are remembered
"
" see also:
"
"   - the vim docs contain another way to accomplish this:
"       :h ]] | /not in the first column/
"     but the way ]] is remapped there makes it impossible to use a count, and
"     they all wrap around at the beginning and end of the buffer
"
"------------------------------------------------------------------------------

"---
" find previous beginning curly
function! Bcurlyprev()
  " loop thru 1 or more times
  let c = 0
  while c < v:count1
    let line0 = line('.')
    " if we start "{ here } .... { .... }", this is enough
    silent normal ][
    if getline(line('.'))[col('.') - 1] == '}'
      silent normal %
    endif
    " if we start "{ .... } here { .... }", we also have to do this
    if line('.') >= line0
      silent normal []
      if getline(line('.'))[col('.') - 1] == '}'
        silent normal %
      endif
    endif
    let c = c + 1
  endwhile
endfunction

"---
" find next beginning curly
function! Bcurlynext()
  " loop thru 1 or more times
  let c = 0
  while c < v:count1
    let line0 = line('.')
    " if we start "{ .... } here { .... }", this is enough
    silent normal ][
    if getline(line('.'))[col('.') - 1] == '}'
      silent normal %
    endif
    " if we start "{ here } .... { .... }", we also have to do this
    if line('.') <= line0
      silent normal ][][
      if getline(line('.'))[col('.') - 1] == '}'
        silent normal %
      endif
    endif
    let c = c + 1
  endwhile
endfunction

"---
" remap [[ and ]]
:noremap <silent> [[ :<C-U>call Bcurlyprev()<CR>
:noremap <silent> ]] :<C-U>call Bcurlynext()<CR>

"=== end-of-file: bcurly.vim ==================================================

