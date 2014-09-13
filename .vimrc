"---
" file: .vimrc
" date: 199?-??-??..2002-03-12..2002-07-21..2002-12-12..2003-05-06..
"       2003-05-26..2005-09-02..2005-09-04..2005-09-05..2007-07-20..
"       2011-09-16
"
" .vimrc file for vim v6.0 [ew] (originally for vim v5.4)
"

" this isn't used anymore ...
"----------
" vim v4.x
"----------
"version 4.0

"------------------
" harmless options
"------------------
"set helpfile=d:/bin/vim/doc/vim_help.txt
"set helpfile=/usr/local/share/vim/doc/help.txt
"set helpfile=/usr/share/vim/doc/help.txt
"set helpfile=/usr/share/vim/vim54/doc/help.txt
"set isprint=@,~-255
set laststatus=2
"
"set statusline=%<%f\ %h%w%m%r%{&paste?\"\ (paste)\":\"\"}%=%n:\ %4(<%{strtrans(getline(line(\".\"))[col(\".\")-1])}>%)\ %3b\ 0x%02B\ %6l,%-5(%c%V%)\ %P
" this one uses the User9 highlight group set at the bottom of this file
"set statusline=%<%f\ %h%w%m%r\ %9*%{&paste?\"(paste)\":\"\"}%*%=%n:\ %4(<%{strtrans(getline(line(\".\"))[col(\".\")-1])}>%)\ %3b\ 0x%02B\ %6l,%-5(%c%V%)\ %P
set statusline=%<%f\ %h%w%m%r\ %9*%{&paste?'(paste)':''}%*%=%n:\ %4(<%{strtrans(substitute(getline(line('.'))[col('.')-1:-1],'\\(.\\).*','\\1',''))}>%)\ %3b\ 0x%02B\ %6l,%-5(%c%V%)\ %P
"
"set report=1
set report=0
set ruler
set scrolloff=2
set showcmd
set viminfo='50,ra:,rb
set visualbell
set incsearch
set hlsearch
set showmatch
"set shortmess=at  " maybe activate this one...?
"set infercase     " maybe activate this one...?

"--------------------------
" possibly harmful options
"--------------------------
set autoindent
set ignorecase
set shiftwidth=2
set smarttab
"set term=os2ansi
"set textwidth=79
"set dictionary=/usr/dict/words
set dictionary-=/usr/share/dict/words  dictionary+=/usr/share/dict/words
set dictionary-=/usr/share/dict/web2   dictionary+=/usr/share/dict/web2
set dictionary-=/usr/share/dict/bokmal dictionary+=/usr/share/dict/bokmal
"set dictionary=/etc/dictionary
set expandtab
set smartcase
set noedcompatible " this is the default, but it is set on in /etc/vimrc in
                   "   vim v5.4 in suse v6.3
set backspace=1
set nohidden
"set hidden        " haven't decided if i want this one (good for undo, bad
                   "   when editing a file already open in another vim)
"set nostartofline  " this would be nice for *some* key combinations
"set textwidth      " maybe use an autocmd for *.txt files
set cpoptions-=a cpoptions-=A  " don't set alt filename for r/w (good for .gz)
"
" time out on mappings after 3 sec, time out on key codes after 1/10 sec
"set timeout timeoutlen=1000 nottimeout ttimeoutlen=-1
set timeout timeoutlen=3000 ttimeoutlen=100

"-------------------------
" mappings: ordinary keys
"-------------------------
"
" gf keep cursor position
" (eh, no -- not so smart to use `" to keep cursor position if display is
" split in two windows and viewing the same file in both)
"noremap gf gf`"
"
" gf hide if necessary
" (eh, no -- it goes to start of file when file already is loaded)
"noremap gf :hide edit <cfile><CR>
"
" Ctrl-^: like default, but hide if necessary and keep the cursor position
" (eh, no -- don't use `" to keep cursor position (see above))
"noremap <C-^> <C-^>`"
"noremap <C-^> :b #<CR>`"
" none of the two following are perfect, they can't take a count like the
" "real" Ctrl-^ can...  (the first one complains and does nothing when given a
" count, the second silently ignores it)
noremap <C-^> :b! #<CR>
"noremap <C-^> :<C-U>b! #<CR>
"
" Ctrl-C:
" like default, but also turn off 'hlsearch' highlighting.
" both of them seems to work ok, don't know if one is better than the other...
" according to the docs (Vim v6.1 map.txt), Ctrl-C shouldn't be mapped;
"   :help map_CTRL_C
"   "It's not possible to use a CTRL-C in the {lhs}.  You just can't map
"   CTRL-C.  The reason is that CTRL-C must always be available to break a
"   running command."
" but it seems to work ok...(?)  Even after the mapping, Ctrl-C can be used as
" usual, for example to interrupt matches that locks up vim.
nnoremap <C-C> :noh<CR><C-C>
"nnoremap <C-C> <C-C>:noh<CR>
"
" Ctrl-G: on command line, act as Ctrl-C, but show buffer info as well
"   (sort of like a combination of vi and emacs :)
"   actually, it is a bit irritating having to press Enter when the buffer
"   info displayed by Ctrl-G is too long, so now Ctrl-G acts identical to
"   Ctrl-C.  just re-press it to get buffer info.
"cmap <C-G> <C-C><C-G>
cmap <C-G> <C-C>
"
" Ctrl-J: execute current line as an ex command (is this mapping a bad idea?)
map <C-J> yy:<C-R>"<BS><Enter>
imap <C-J> <Esc>yy:<C-R>"<BS><Enter>a
"
" \\: very magic regexp matching
map \\ /\v

"------------------------
" mapping: function keys
"------------------------
"
" s-f1 help in only window (close all others)
" (hmmm...  in text terminal mode sometimes <F11> also output <Esc>[23~ so i
" guess i'll wait with this one...)
"if ! has ("gui_running")
"  map <Esc>[23~ :h\|only\|redraw!\|file<CR>
"else
"  map <S-F1> :h\|only\|redraw!\|file<CR>
"endif
"
" f2: write buffer to file (= save file)
map <F2> :w<CR>
imap <F2> <C-O>:w<CR>
"
" f3: buffer list selector
map <F3> :ls<CR>:b!<Space>
cmap <F3> <C-C><CR>
map <Leader><F3> :ls!<CR>:b!<Space>
"
" f4: match current line and jump to it (mcline)
map <f4> \ll
map <Leader><F4> \llzt
"
" nice for scrolling (used to be at f11 and f12)
map <F5> <C-E>
map <F6> <C-Y>
imap <F5> <C-O><C-E>
imap <F6> <C-O><C-Y>
"
" f7/f8: previous/next buffer (hide if necessary)
"map <F7> :bp<CR>`"
"map <F8> :bn<CR>`"
"map <F7> :bp!<CR>`"
"map <F8> :bn!<CR>`"
"map <F7> :bp!<CR>
"map <F8> :bn!<CR>
" f7/f8: next/previous buffer (hide if necessary), switched - more like j/k
map <F7> :bn!<CR>
map <F8> :bp!<CR>
imap <F7> <C-O>:bn!<CR>
imap <F8> <C-O>:bp!<CR>
"
" shift-f8 call nohlsearch (stop highlighting of search)
" (<S-F8> doesn't work in text mode, so the escape sequence is used)
" (ctrl-c does this now, so it's not needed)
"map <S-F8> :noh<CR>
"map <Esc>[34~ :noh<CR>
"imap <S-F8> <C-O>:noh<CR>
"imap <Esc>[34~ <C-O>:noh<CR>
"
" f9: toggle paste
"map <F9> :set invpaste<CR>
set pastetoggle=<F9>
map <F9> :set invpaste<CR><C-L>:set paste?<CR>
"
" f10: thlnk plugin (plain text hyperlink) command: go url
map <F10> \gu
"
" nice for scrolling (moved to 56 and f6)
"map <F11> <C-E>
"map <F12> <C-Y>
"imap <F11> <C-O><C-E>
"imap <F12> <C-O><C-Y>
"
" alternative -- also moves the cursor (doesn't work too good at top of file)
"map <F11> <C-E>j
"map <F12> <C-Y>k
"
" old stuff
"map <F12> :let &term=&term<CR>
"map <F12> :let &term=&term<CR>:set term?<CR>

"--------------
" abbrevations
"--------------
"
" remove trailing whitespace (i used to have a space and a literal tab in
" the class inside [], but now it seems to be ok having \t inside the class)
cabbrev rmtrws %s/[ \t]\+$//gc
"
" fix for "screen" (when running vim in black on lightgray in tty mode)
" (is this really needed?)
cabbrev scrfix se term=linux bg=light \| syntax on
"
" magenta news mail
" this one is now renamed to s2m and augmented with m2s (which does the
" opposite), and both of them are put in ~/.vim/ftplugin/mail.vim
"cabbrev mnm %s/erik\.warendorph@start\.no/erik@magentanews.com/g

"----------
" digraphs
"----------
" norwegian vowels (ae AE is already on by default)
digraphs ae 230 AE 198 oe 248 OE 216 aa 229 AA 197

"----------------------
" sourcing other files
" (this doesn't look so
" good in x mode)
"----------------------
if ! has ("gui_running")
  "set term=linux
  "set background=light
  "so $HOME/vim/colewl
  "so $HOME/vim/hlterm  " 2001-03-13 [ew] commented out
  " don't mess with my *term title line and icon name in x
  set notitle noicon
else
  " this has to be done in x mode
  " (the default used to be 80x25 (but not always...???))
  " (now (2003-05-26, vim v6.1) the default seems to be to maximize the window)
  set columns=80 lines=50
endif

"---
" color
"   - source ~/vim/colors/ew.vim
colorscheme ew

"---
" use perl for asa and asp files
"let g:filetype_asa = "aspvbs"
"let g:filetype_asp = "aspvbs"
let g:filetype_asa = "aspperl"
let g:filetype_asp = "aspperl"

"---
" my syntax file 2001-03-15 [ew]
let mysyntaxfile = "~/vim/mysyntax.vim"

"----------
" vim v5.x
"----------
if version >= 500
  let bash_is_sh = 1
  syntax on
endif

" used for the 'statusline' option above
" (looks like this has to be executed after "syntax on")
hi User9 ctermfg=black ctermbg=red

"-------------------------------
" this must be sourced after
" the syntax has been turned on
" (this has now been moved to ~/vim/mysyntax.vim)
"if ! has ("gui_running")
"  so $HOME/vim/cterm-colors.vim  " 2001-03-15 [ew]
"endif

"--------------
" autocommands
"--------------
"
" these two are very old, i think i used them in os/2 and/or dos to avoid
" getting an empty line when exiting vim.  they used to have literal esc's,
" but now i changed them to "\033" (so i also had to add the -e option to the
" first one).  i'm not sure if they work as intended anymore, but it doesn't
" really matter since they are commented out (linux does not display an empty
" line when exiting vim)
"autocmd VimLeave * :!/bin/echo -e '\033[0m\033[K\033[2A'
"autocmd VimLeave * :!/bin/echo -en '\033[0m\033[K\033[1A'
"
" use php3 for .phtml files (default is /usr/share/vim/syntax/phtml.vim)
autocmd BufEnter *.phtml so $VIMRUNTIME/syntax/php3.vim
"
" vb/asp
autocmd BufEnter *.vb so $VIMRUNTIME/syntax/vb.vim
autocmd BufEnter *.asp so $VIMRUNTIME/syntax/vb.vim
" txt
autocmd BufEnter ~/*.txt set ft=txt

"------------------------
" swap dir and backupdir
"------------------------
"set directory=.,~/tmp,/var/tmp,/tmp
set directory=~/tmp/vim//,/var/tmp,/tmp,.
"set backupdir=.,~/tmp,~/
set backupdir=~/tmp/vim//,~/,.

