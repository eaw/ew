"==============================================================================
" BEGIN CURLY BRACE
"
" file:    bcurly.vim
" version: v0.03
" type:    vim script
" author:  Erik Warendorph <erik.warendorph@start.no> [ew]
" date(s): 2003-01-20..2005-09-01
"
" description:
"
"   - Reimplementation of [[ and ]], allowing beginning curly brace anywhere
"
"   - This is useful when dealing with code where the functions are coded like
"     this (this style is very often used in perl):
"
"       sub foo {
"         ...
"         ...
"       }
"
" notes:
"
"   - The new versions of [[ and ]] will work as long as the ending curly
"     brace is at the start of a line.
"
"   - Parts of this script were inspired by Piet Delport's findchar.vim
"     (reimplemtation of: f F t T ; ,) and Benji Fisher's tip about using
"     <C-U> in mappings and v:count1 in the functions to handle counts for
"     mappings.
"
" bugs:
"
"   - Since [[ and ]] now are implemented by doing ][ or [] followed by %, the
"     buffer might sometimes scroll unexpectedly, for example when the end
"     curly is off the screen while the start curly is on it.  I thought that
"     setting lazyredraw maybe would fix with this, but it doesn't... (I guess
"     that's not really the point of this option -- I kept the code in anyway
"     to make sure the display wouldn't show the cursor jumping around
"     (although it didn't really happen before I included the code)).
"     Actually, I think it could be fixed by using the following
"     builtin functions/options, and calculating whether the start position
"     was still inside the window at the end of the function, and then
"     scrolling up up/down to "undo" the unwanted scroll movement:
"
"       winline()
"       line(".")
"       winheight(0)
"       &scrolloff
"
"   - The jumplist will contain too much, all the jumps inside the functions
"     are remembered.
"
" see also:
"
"   - The vim docs contain another way to accomplish this:
"       :h ]] | /not in the first column/
"     but the way ]] is remapped there makes it impossible to use a count, and
"     they all wrap around at the beginning and end of the buffer.
"
"------------------------------------------------------------------------------

"---
" find previous beginning curly
function! Bcurlyprev()
  " save lazyredraw and set it on
  let save_lazyredraw = &lazyredraw
  set lazyredraw
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
  " restore lazyredraw, and redraw the screen
  let &lazyredraw = save_lazyredraw
  redraw
endfunction

"---
" find next beginning curly
function! Bcurlynext()
  " save lazyredraw and set it on
  let save_lazyredraw = &lazyredraw
  set lazyredraw
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
  " restore lazyredraw, and redraw the screen
  let &lazyredraw = save_lazyredraw
  redraw
endfunction

"---
" remap [[ and ]]
:noremap <silent> [[ :<C-U>call Bcurlyprev()<CR>
:noremap <silent> ]] :<C-U>call Bcurlynext()<CR>

"=== end-of-file: bcurly.vim ==================================================

