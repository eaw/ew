"
" trailing whitespace
"
" file:   trailws.vim
" date:   2001-03-12
" author: [ew] erik warendorph
"
" based on whitespace.vim
"

" this can be added to an already active syntax
"syn clear

syn match TrailingWS "[ \t]\+$"
if &background == "dark"
  hi TrailingWS ctermbg=darkred guibg=#500000
else
  hi TrailingWS ctermbg=lightred guibg=#ffd0d0
endif

