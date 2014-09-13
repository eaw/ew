"------------------------------------------------------------------------------
" file:   evim-extra.vim
" date:   2002-02-20
" author: erik warendorph [ew]

" backspace over everything
set backspace=2

" make cursorkeys wrap in insertmode
set whichwrap=b,s,[,]

" write backup, but don't keep it
set nobackup
set   writebackup

" ctrl-s = save
inoremap <C-S> <C-O>:w<CR>

" alt-tab makes evim output tab, so we just make tab a dummy command
inoremap <TAB> <C-O><C-L>

" ctrl-e = open file (edit file)
"inoremap <C-E> <C-O>:?????<CR>

" ctrl-f = find/search
inoremap <C-F> <C-O>/

"------------------------------------------------------------------------------

