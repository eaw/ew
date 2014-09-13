"==============================================================================
" MATCH CURRENT LINE
"
" file:    mcline.vim
" version: v0.03
" type:    vim script
" author:  Erik Warendorph <erik.warendorph@start.no> [ew]
" date(s): 2002-12-14..2002-12-15..2002-12-19..2003-03-10
"
" description:
"
"   - jump to next line matching current line
"
" mappings:
"
"   keys  line matching
"   ----  ---------------------------------------------------------------------
"   \ll   "line-change" (all of the below except "exactly", until line changes)
"   \lx   "exactly"
"   \ls   "space"
"   \ld   "dot/digit"
"   \lc   "comment/bullet char"
"   \la   "anywhere"
"   \lA   "anywhere/approximately"
"
"   \ll is probably the most useful one.  for a more detailed description, see
"   the Mcline() function below.
"
" notes:
"
"   - the main use for this script is when you have a text file with a "table
"     of contents" containing lines that match heading lines in the "main"
"     document below, and you want to jump from the toc to the headings (and
"     back)
"   - i prefer to have the following mapping (in addition to the ones at the
"     end of the script):
"       :map <F4> \llzt
"   - the script is based on matchline.vim (an earlier, simpler script with
"     only mappings)
"   - both mcline.vim and matchline.vim were inspired by the internal * command
"     and Stefan Bittner's excellent thlnk.vim script
"   - case (in)sensitivity isn't handled at all here (it might not really be
"     such a big issue) -- personally, i use
"       :set ignorecase smartcase
"     which seems to work ok with the script, but maybe these options should be
"     set explicitly to temporary values, and maybe \ll should first try case
"     sensitive and then case insensitive matching
"
" (for a simple test, source the script and press \ll at the toc lines below)
"
"------------------------------------------------------------------------------

" toc
"
"   default values for global variables
"   main function: Mcline() -- match current line
"     x: "exactly"
"     s: "space"
"     d: "dot/digit"
"     c: "comment/bullet char"
"     a: "anywhere"
"     A: "anywhere/approximately"
"     l: "line-change"
"   mappings

"---
" default values for global variables
"
" set search pattern register
" (if set to 1, it behaves like the * command, that is, like an ordinary
" search, so n and N will search for the next and previous matching line)
if !exists("g:mcline_setreg")
 let g:mcline_setreg = 1
endif
"
" execute :nohls after matching
" (if g:mcline_setreg is 0, you probably want this one set to 0 as well)
if !exists("g:mcline_nohl")
 let g:mcline_nohl = 1
endif
"
" display status for successful match
" (at the moment this only displays the current linenumber, but it might change
" later)
if !exists("g:mcline_status")
 let g:mcline_status = 1
endif

"---
" main function: Mcline() -- match current line
"   - takes one of the following letters as argument:  x s d a A l
"   - moves the cursor to the next line matching the current line
"   - returns the linenumber of the line moved to
function! Mcline(arg)  " {

  " x: "exactly"
  "   - match line exactly
  if     a:arg ==# 'x'
    let rx = escape(getline('.'), '\/')             " slash and backslash
    let rx = '\V\^' . rx . '\$'

  " s: "space"
  "   - match line with relaxed treatment of whitespace (leading and trailing
  "     ws is optional, the number of consecutive inner ws-characters are
  "     ignored) (useful when the headings in the toc are indented (relative
  "     to the main text))
  elseif a:arg ==# 's'
    let rx = escape(getline('.'), '\/')
    let rx = substitute(rx, '^\s*', '\\s\\*', '')   " leading whitespace
    let rx = substitute(rx, '\s*$', '\\s\\*', '')   " trailing whitespace
    let rx = substitute(rx, '\s\+', '\\s\\+', 'g')  " inner whitespace
    let rx = '\V\^' . rx . '\$'                     " very non-magic, anchors

  " d: "dot/digit"
  "   - match line ignoring dots after digits (useful for text files generated
  "     from sgml, where the heading numbering often has trailing dots in the
  "     main text but not in the toc (eg linux howtos)).  also ignores
  "     non-digit comment/bullet chars (almost like "c")
  elseif a:arg ==# 'd'
    let rx = escape(getline('.'), '\/')             " slash & backslash
    let rx = substitute(rx, '^\s*', '\\s\\*', '')   " leading whitespace
    let rx = substitute(rx, '^\\s\\\*\(\(\\/\\/\|\D\)\?\s\+\)\?',
      \ '\\s\\*\\(\\/\\/\\|\\D\\)\\?\\s\\*', '')    " leading nondigit chr + ws
    let rx = substitute(rx, '\s*$', '\\s\\*', '')   " trailing whitespace
    let rx = substitute(rx, '\s\+', '\\s\\+', 'g')  " inner whitespace
    let rx = substitute(rx, '\(\d\)\.\?[0-9.]\@!', '\1.\\?', 'g')  " dot/digit
    let rx = '\V\^' . rx . '\$'                     " very nomagic, anchors

  " c: "comment/bullet char"
  "   - match line ignoring all leading comment and bullet chars (not
  "     necessarily non-digit).  also ignores dots after digits (like "d")
  elseif a:arg ==# 'c'
    let rx = escape(getline('.'), '\/')             " slash & backslash
    let rx = substitute(rx, '^\s*', '\\s\\*', '')   " leading whitespace
    let rx = substitute(rx, '^\\s\\\*\(\(\\/\\/\|.\)\?\s\+\)\?',
      \ '\\s\\*\\(\\/\\/\\|\\.\\)\\?\\s\\*', '')    " leading char + ws
    let rx = substitute(rx, '\s*$', '\\s\\*', '')   " trailing whitespace
    let rx = substitute(rx, '\s\+', '\\s\\+', 'g')  " inner whitespace
    let rx = substitute(rx, '\(\d\)\.\?[0-9.]\@!', '\1.\\?', 'g')  " dot/digit
    let rx = '\V\^' . rx . '\$'                     " very nomagic, anchors

  " a: "anywhere"
  "   - match line anywhere
  elseif a:arg ==# 'a'
    let rx = escape(getline('.'), '\/')             " slash & backslash
    let rx = substitute(rx, '^\s\+', '', '')        " del leading whitespace
    let rx = substitute(rx, '\s\+$', '', '')        " del trailing whitespace
    let rx = substitute(rx, '\s\+', '\\s\\+', 'g')  " inner whitespace
    let rx = '\V' . rx                              " very nomagic, no anchors

  " A: "anywhere/approximately"
  "   - match line anywhere and approximately, ignoring dots after digits
  "     (this is meant to be the most "forgiving" way of calling the function,
  "     so it might change later)
  elseif a:arg ==# 'A'
    let rx = escape(getline('.'), '\/')             " slash & backslash
    let rx = substitute(rx, '^\s\+', '', '')        " del leading whitespace
    let rx = substitute(rx, '\s\+$', '', '')        " del trailing whitespace
    let rx = substitute(rx, '\s\+', '\\s\\+', 'g')  " inner whitespace
    let rx = substitute(rx, '\(\d\)\.\?[0-9.]\@!', '\1.\\?', 'g')  " dot/digit
    let rx = '\V' . rx                              " very nomagic, no anchors

  " l: "line-change" -- try all (except 'x') until linenumber changes
  "                     (recursively calling the Mcline() function itself)
  elseif a:arg ==# 'l'
    "echo "Mcline(): searching..."
    let linenum = line('.')
    let tryarg = 's'
    silent call Mcline(tryarg)
    if line('.') == linenum
      let tryarg = 'd'
      silent call Mcline(tryarg)
    endif
    if line('.') == linenum
      let tryarg = 'c'
      silent call Mcline(tryarg)
    endif
    if line('.') == linenum
      let tryarg = 'a'
      silent call Mcline(tryarg)
    endif
    if line('.') == linenum
      let tryarg = 'A'
      silent call Mcline(tryarg)
    endif
    if line('.') == linenum
      echohl WarningMsg
      echo "Mcline('" . a:arg . "'): no other matching line found"
      echohl none
    else
      if g:mcline_status == 1
        echo "Mcline('" . tryarg . "'): " . line('.')
      endif
    endif

  " unknown argument
  else
    echohl WarningMsg
    echo "Mcline(" . a:arg . "): unknown argument: " . a:arg
    echohl none
    return -1  " !!! terminate function here !!!

  endif

  " if not 'l', do the actual matching, etc
  if a:arg !=# 'l'
    " mark current position (so we can jump there with <C-O> and '')
    mark '
    " match (temporarily setting wrapscan)
    "echo "Mcline(): searching..."
    let linenum = line('.')
    let old_wrapscan = &wrapscan
    set wrapscan
    silent exec '/' . rx
    let &wrapscan = old_wrapscan
    " check for movement
    if line('.') == linenum
      echohl WarningMsg
      echo "Mcline('" . a:arg . "'): no other matching line found"
      echohl none
    else
      if g:mcline_status == 1
        echo "Mcline('" . a:arg . "'): " . line('.')
      endif
    endif
    " set search pattern register
    if g:mcline_setreg == 1
      let @/ = rx
    endif
    " no highlight
    " (this doesn't really work inside a function, so it's commented out and
    " handled by the mappings below instead -- see ":h noh" and
    " ":h autocmd-searchpat")
    "if g:mcline_nohl == 1
    "  nohlsearch
    "endif
  endif

  " return the current linenumber
  return line('.')

endfunction  " }

"---
" mappings
"map <silent> <Leader>lx :call Mcline('x')<CR>
"map <silent> <Leader>ls :call Mcline('s')<CR>
"map <silent> <Leader>ld :call Mcline('d')<CR>
"map <silent> <Leader>lc :call Mcline('c')<CR>
"map <silent> <Leader>la :call Mcline('a')<CR>
"map <silent> <Leader>lA :call Mcline('A')<CR>
"map <silent> <Leader>ll :call Mcline('l')<CR>
"
" (we have to add the highlight test here)
map <silent> <Leader>lx :call Mcline('x')
  \ \| if g:mcline_nohl == 1 \| noh \| endif<CR>
map <silent> <Leader>ls :call Mcline('s')
  \ \| if g:mcline_nohl == 1 \| noh \| endif<CR>
map <silent> <Leader>ld :call Mcline('d')
  \ \| if g:mcline_nohl == 1 \| noh \| endif<CR>
map <silent> <Leader>lc :call Mcline('c')
  \ \| if g:mcline_nohl == 1 \| noh \| endif<CR>
map <silent> <Leader>la :call Mcline('a')
  \ \| if g:mcline_nohl == 1 \| noh \| endif<CR>
map <silent> <Leader>lA :call Mcline('A')
  \ \| if g:mcline_nohl == 1 \| noh \| endif<CR>
map <silent> <Leader>ll :call Mcline('l')
  \ \| if g:mcline_nohl == 1 \| noh \| endif<CR>

"=== end-of-file: mcline.vim ==================================================

