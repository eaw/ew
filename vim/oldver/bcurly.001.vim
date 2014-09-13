" bcurly.vim v0.01 2003-01-20 [ew]

function! Bcurlyprev()
  let c = 0
  while c < v:count1
    let line0 = line('.')
    silent normal ][
    if getline(line('.'))[col('.') - 1] == '}'
      silent normal %
    endif
    if line('.') >= line0
      silent normal []
      if getline(line('.'))[col('.') - 1] == '}'
        silent normal %
      endif
    endif
    let c = c + 1
  endwhile
endfunction

function! Bcurlynext()
  let c = 0
  while c < v:count1
    let line0 = line('.')
    silent normal ][
    if getline(line('.'))[col('.') - 1] == '}'
      silent normal %
    endif
    if line('.') <= line0
      silent normal ][][
      if getline(line('.'))[col('.') - 1] == '}'
        silent normal %
      endif
    endif
    let c = c + 1
  endwhile
endfunction

"command! -count=1 Bcurlyprev call Bcurlyprev(<count>)
"command! -count=1 Bcurlynext call Bcurlynext(<count>)

:noremap <silent> [[ :<C-U>call Bcurlyprev()<CR>
:noremap <silent> ]] :<C-U>call Bcurlynext()<CR>

