"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
"find
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
"bold
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
"italic
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
"scratch out
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
"code
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
"picture
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
"link
autocmd Filetype markdown inoremap <buffer> ,l [](<++>) <++><Esc>F[a
"multiple
autocmd Filetype markdown inoremap <buffer> ,t - [ ] <Enter><++><ESC>kA
"math
autocmd Filetype markdown inoremap <buffer> ,m $$ <++><Esc>F$i

"CR
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>


"MATH
"=======
"
autocmd Filetype markdown inoremap <buffer> ,U ^{} <++><Esc>F}i
autocmd Filetype markdown inoremap <buffer> ,D _{} <++><Esc>F}i
autocmd Filetype markdown inoremap <buffer> ,F \frac{}{<++>} <++><Esc>F}F}i
autocmd Filetype markdown inoremap <buffer> ,E \times10^{} <++><Esc>F}i


"BRACKET
"=======
"
autocmd Filetype markdown inoremap <buffer> ( () <++><Esc>F)i

