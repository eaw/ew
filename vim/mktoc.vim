" mktoc.vim 2003-01-14 [ew]

function! Mktoc(...)  " {
  " use last search pattern or pattern given as argument
  if !exists("a:1") || a:1 == ''
    let rx = @/
  else
    let rx = a:1
  endif
  " mark current position
  mark '
  " yank matching lines into register m
  let @m = ""
  exe ":g/" . rx . "/sil y M"
  " remove leading newline and add a trailing one
  let @m = substitute(@m, "^\n", '', '')
  let @m = @m . "\n"
  " jump back to marked position and put the yanked lines there
  norm ``
  put m
endfunction  " }

command! -nargs=* Mktoc call Mktoc(<q-args>)

