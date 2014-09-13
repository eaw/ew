"==============================================================================
" MATCH LINE
"
" file:    matchline.vim
" version: v0.01
" type:    vim script
" author:  erik warendorph [ew]
" date(s): 2002-11-17..2002-11-17
"
" description:
"
"   - jump to next line matching current line
"
"------------------------------------------------------------------------------

" \lx: match exactly
"   - backslash / and \
map <silent> <leader>lx :echo "" \| exec "/\\V\\^" .
  \ substitute(getline("."), "\\([/\\\\]\\)", "\\\\\\1", "g") .
  \ "\\$"
  \ \| noh<CR>

" \ll: match loosely
"   - backslash / and \
"   - ignore leading whitespace and number of consecutive whitespace chars
map <silent> <leader>ll :echo "" \| exec "/\\V\\^" .
  \ substitute(substitute(escape(getline("."), "/\\"), "^\\s*",
  \ "\\\\s\\\\*", ""), "\\s\\+", "\\\\s\\\\+", "g") .
  \ "\\$"
  \ \| noh<CR>
"
"map <silent> <leader>ll :echo "" \| exec "/\\V\\^" .
"  \ substitute(substitute(substitute(getline("."), "\\([/\\\\]\\)",
"  \ "\\\\\\1", "g"), "^\\s*", "\\\\s\\\\*", ""), "\\s\\+", "\\\\s\\\\+", "g") .
"  \ "\\$"
"  \ \| noh<CR>
"
"" \ll: match loosely
""   - backslash / and \
""   - ignore leading whitespace and number of consecutive whitespace chars
""   - use search() instead of / -- this doesn't update the search history
"map <silent> <leader>ll :call search("\\V\\^" .
"  \ substitute(substitute(substitute(getline("."), "\\([/\\\\]\\)",
"  \ "\\\\\\1", "g"), "^\\s*", "\\\\s\\\\*", ""), "\\s\\+", "\\\\s\\\\+",
"  \ "g") . "\\$")<CR>

" \ld: match ignoring dots after digits
"   - backslash / and \
"   - ignore leading whitespace and number of consecutive whitespace chars
"   - ignore dots after digits before non-digits
map <silent> <leader>ld :echo "" \| exec "/\\V\\^" .
  \ substitute(substitute(substitute(escape(getline("."), "/\\"), "^\\s*",
  \ "\\\\s\\\\*", ""), "\\s\\+", "\\\\s\\\\+", "g"),
  \ "\\(\\d\\)\\.\\?\\d\\@!", "\\1.\\\\?", "g") .
  \ "\\$"
  \ \| noh<CR>

" \la: match anywhere on line
"   - backslash / and \
"   - ignore leading whitespace and number of consecutive whitespace chars
"   - dont't use ^ and $ anchors
map <silent> <leader>la :echo "" \| exec "/\\V" .
  \ substitute(substitute(substitute(getline("."), "\\([/\\\\]\\)",
  \ "\\\\\\1", "g"), "^\\s*", "", ""), "\\s\\+", "\\\\s\\\\+", "g")
  \ \| noh<CR>

"=== end-of-file: matchline.vim ===============================================

