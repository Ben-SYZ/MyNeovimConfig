"let mapleader=" "
" treat all the number as decimal system, seems oct does not work 0x worked
"set nrformats=
"""""""""""""""""""""""""""""""""""""

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"vim exec *** , exec at the dir where the file is



"some tricks
" gx open link in browser

"<operation>_<motion>

"c motion change
"cw delete from current word to the end
"ciw change in world when you at the middle of the word delete the wordi"
"ci" change in "
"you can also use di yi, all these means 'in'

"f motion find the word
" df: delete to (find :) 
"also for c y

"---
"zz let the current line move to the middle line

"get all the file names in tmp vim file
"ranger v :bulkrename

"row visual
"<shift>+v

"-----
"after v-LINE insert *** vim will do *** like in normal for every line (position can also be done by hjkl etc. 
":normal *** 
"eg *** i ---hello---

"block visual
"<ctrl> v
"in block mode, do the motion (i,j) at the select words
"<shift> i or c etc




" ===
" === Scripts
" ==========

" ===
" === try
" ==========
"source ~/.config/nvim/entire.vim
"set backupskip+=*.asc
"set viminfo=
"
"augroup GPG
"  autocmd!
"  autocmd BufReadPost  *.asc :%!gpg -q -d
"  autocmd BufReadPost  *.asc |redraw!
"  autocmd BufWritePre  *.asc :%!gpg -q -e -a
"  autocmd BufWritePost *.asc u
"  autocmd VimLeave     *.asc :!clear
"augroup END

