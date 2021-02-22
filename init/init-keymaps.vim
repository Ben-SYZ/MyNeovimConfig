"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-h> <BS>

"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <BS>
cnoremap <c-d> <del>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <c-a> <home>
cnoremap <c-e> <end>

"Keyboard map
nnoremap : '
nnoremap ' :
vnoremap : '
vnoremap ' :
nnoremap ; "

" Direction
" =================
" col
noremap h h
noremap n j
noremap e k
noremap i l
noremap N 5j
noremap E 5k

" line
noremap b b
noremap f e
"noremap B 5b
noremap F E
"noremap W 5w

" insert
noremap u i
noremap U I
" <tab> is <C-i>
nnoremap <c-u> <c-i>
nnoremap <c-y> <c-o>

" page up
nnoremap <c-l> <c-u>
nnoremap <c-s> <c-d>

" copy
noremap Y y$

" undo
noremap l u

" add
noremap a a
noremap A A

" search
noremap <space><CR> :nohlsearch<CR>
noremap k n
noremap K N
noremap t f
" tag yit still worked
noremap j t


tnoremap <Esc> <C-\><C-n>


" C-a num++ c-x num--
"nnoremap <C-a> 0
nnoremap <C-e> $
nnoremap S :w<CR>
nnoremap Q :q<CR>
nnoremap <space>R :source $MYVIMRC<CR>

"map s <nop>
nnoremap <space>sh :set nosplitright<CR>:vsplit<CR>
nnoremap <space>sn :set splitbelow<CR>:split<CR>
nnoremap <space>se :set nosplitright<CR>:split<CR>
nnoremap <space>si :set splitright<CR>:vsplit<CR>
"exchange split window
nnoremap <space>h <C-w>h
nnoremap <space>n <C-w>j
nnoremap <space>e <C-w>k
nnoremap <space>i <C-w>l

"resize the split window
nnoremap <c-up> :res -5<CR>
nnoremap <c-down> :res +5<CR>
nnoremap <c-left> :vertical resize +5<CR>
nnoremap <c-right> :vertical resize -5<CR>
"change the vertical split to horizontal, vise versa
nnoremap sv <C-w>t<C-w>H
nnoremap sV <C-w>t<C-w>K
"在shell里打开几个文件并且分屏:
" vim -O file1 file2 ...
" vim -o file1 file2 ...
" O: vertical
" o: horizontal(default)
"new tab
nnoremap <tab>k :tabe<CR>
"exchange in tab
nnoremap <tab>h :-tabnext<CR>
nnoremap <tab>i :tabnext<CR>
"----------------------------------------------------------------------
" <leader>+数字键 切换tab
"----------------------------------------------------------------------
noremap <silent><leader>1 1gt<cr>
noremap <silent><leader>2 2gt<cr>
noremap <silent><leader>3 3gt<cr>
noremap <silent><leader>4 4gt<cr>
noremap <silent><leader>5 5gt<cr>
noremap <silent><leader>6 6gt<cr>
noremap <silent><leader>7 7gt<cr>
noremap <silent><leader>8 8gt<cr>
noremap <silent><leader>9 9gt<cr>
noremap <silent><leader>0 10gt<cr>

"----------------------------------------------------------------------
" ALT+N 切换 tab
"----------------------------------------------------------------------
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>


"vim a b c change between buffers
nnoremap <space>Bh :bp<CR>
nnoremap <space>Bi :bn<CR>
