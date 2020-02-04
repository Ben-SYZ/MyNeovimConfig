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
autocmd Filetype markdown nnoremap <LEADER>C i```<++><CR><CR>```<Esc>kp?<++><CR>:nohlsearch<CR>c4l
" autocmd Filetype markdown nnoremap <LEADER>C {i```<++><Esc>}```<CR><Esc>?<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown nnoremap <LEADER>c bi`<Esc>ea`<Esc>
"picture
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
"link
autocmd Filetype markdown inoremap <buffer> ,l [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,L [<Esc>pa](<Esc>pa)
"multiple
autocmd Filetype markdown inoremap <buffer> ,t - [ ] <Enter><++><ESC>kA
"math
autocmd Filetype markdown inoremap <buffer> ,m $$ <++><Esc>F$i
autocmd Filetype markdown inoremap <buffer> ,M $$<Enter><Enter>$$<Enter><Enter><++><Esc>3kA

"CR
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,1 <Esc>I#<Space><Esc>A<Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 <Esc>I##<Space><Esc>A<Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 <Esc>I###<Space><Esc>A<Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 <Esc>I####<Space><Esc>A<Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,5 <Esc>I#####<Space><Esc>A<Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,6 <Esc>I######<Space><Esc>A<Enter><++><Esc>kA
"autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>


"MATH
"=======
"
autocmd Filetype markdown inoremap <buffer> ,u ^{}<++><Esc>F}i
autocmd Filetype markdown inoremap <buffer> ,d _{}<++><Esc>F}i
autocmd Filetype markdown inoremap <buffer> ,r \frac{}{<++>}<++><Esc>F}F}i
autocmd Filetype markdown inoremap <buffer> ,e \times10^{}<++><Esc>F}i
autocmd Filetype markdown inoremap <buffer> ,v \vec{}<++><Esc>F}i


"BRACKET
"=======
"
"autocmd Filetype markdown inoremap <buffer> ( () <++><Esc>F)i

