"==============================================================================
" MATCH LINE
"
" file:    matchline.vim
" version: v0.02
" type:    vim script
" author:  erik warendorph [ew]
" date(s): 2002-11-17..2002-11-18
"
" description:
"
"   - jump to next line matching current line
"
"------------------------------------------------------------------------------

"---
" \lx: match line exactly
"   - backslash / and \
map <silent> <Leader>lx :echo '' \| mark ' \| exec '/\V\^' .
  \ escape(getline('.'), '\/',) .
  \ '\$'
  \ \| noh<CR>

"---
" \ll: match line loosely
"   - backslash / and \
"   - ignore leading whitespace and number of consecutive whitespace chars
"   - useful when the headings in the toc is indented (relative to the
"     main text)
map <silent> <Leader>ll :echo '' \| mark ' \| exec '/\V\^' .
  \ substitute(substitute(escape(getline('.'), '\/'),
  \ '^\s*', '\\s\\*', ''),
  \ '\s\+', '\\s\\+', 'g') .
  \ '\$'
  \ \| noh<CR>
"
"" \ll: match line loosely
""   - as above, but ...
""   - use "exec 'normal /...'" instead of "exec '/...'" to update the jumplist
""   - this is no good, because matching long lines triggers the
""     "Hit ENTER or type command to continue" prompt, no matter how much i
""     try to silence it.  besides, the "mark '" command above updates the
""     jumplist
"map <silent> <Leader>ll :silent exec ':silent normal /\V\^' .
"  \ substitute(substitute(escape(getline('.'), '\/'),
"  \ '^\s*', '\\s\\*', ''),
"  \ '\s\+', '\\s\\+', 'g') .
"  \ '\$' . "\r"
"  \ \| noh<CR>
"
"" \ll: match line loosely
""   - as above, but ...
""   - use search() instead of "exec '/...'" to avoid updating the search
""     history (which might be a good or a bad thing ...)
"map <silent> <Leader>ll :call search('\V\^' .
"  \ substitute(substitute(escape(getline('.'), '\/'),
"  \ '^\s*', '\\s\\*', ''),
"  \ '\s\+', '\\s\\+', 'g') .
"  \ '\$')<CR>

"---
" \ld: match line ignoring dots after digits
"   - backslash / and \
"   - ignore leading whitespace and number of consecutive whitespace chars
"   - ignore dots after digits before non-digits
"   - useful for linux howtos, where the heading numbering often has trailing
"     dots in the main text but not in the toc
map <silent> <Leader>ld :echo '' \| mark ' \| exec '/\V\^' .
  \ substitute(substitute(substitute(escape(getline('.'), '\/'),
  \ '^\s*', '\\s\\*', ''),
  \ '\s\+', '\\s\\+', 'g'),
  \ '\(\d\)\.\?[0-9.]\@!', '\1.\\?', 'g') .
  \ '\$'
  \ \| noh<CR>

"---
" \la: match line anywhere
"   - backslash / and \
"   - ignore leading whitespace and number of consecutive whitespace chars
"   - dont't use ^ and $ anchors
map <silent> <Leader>la :echo '' \| mark ' \| exec '/\V' .
  \ substitute(substitute(escape(getline('.'), '\/'),
  \ '^\s\+', '', ''),
  \ '\s\+', '\\s\\+', 'g')
  \ \| noh<CR>

"=== end-of-file: matchline.vim ===============================================

