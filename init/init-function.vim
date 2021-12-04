" Compile function
nnoremap <space>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    "exec "!g++ % -o %<"
    exec "!gcc % -o %< && time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %< && time ./%<"
  elseif &filetype == 'rust'
    exec "!rustc % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time sh %
  elseif &filetype == 'zsh'
    :!time zsh %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term time python3 %
  elseif &filetype == 'lua'
    :!time lua %
  elseif &filetype == 'html'
    if(has('macunix'))
      exec "!open '%' &"
    elseif(has('unix'))
      exec "firefox '%' &"
  endif
"  elseif &filetype == 'html'
"    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  elseif &filetype == 'mdp'
    exec "terminal mdp %"
  elseif &filetype == 'tex'
    "vim-latex-live-Preview
    exec "LLPStartPreview"
  elseif &filetype == 'vim'
    exec "source %"
  endif
endfunc

" 光标下高亮的名称
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.') - (col('.')>=2 ? 1 : 0)), 'synIDattr(v:val, "name")')
endfunc
" vim air line Chinese word count
"function! airline#extensions#wordcount#formatters#cnfmt#format()
"    return wordcount()['chars'] . '(' . wordcount()['words'] . ') words'
"endfunction
"let g:airline#extensions#wordcount#formatter = 'cnfmt'
function! ChineseCount() range
	let save = @z
	silent exec 'normal! gv"zy'
	let text = @z
	let @z = save
	silent exec 'normal! gv'
	let cc = 0
	for char in split(text, '\zs')
		if char2nr(char) >= 0x2000
			let cc += 1
		endif
	endfor
	echo "Count of Chinese charasters is:"
	echo cc
endfunc

function! ChineseAboveCount()
	let save = @z
	silent exec 'normal! vgg"zy'
	let text = @z
	let @z = save
	silent exec 'normal! gv'
	let cc = 0
	for char in split(text, '\zs')
		if char2nr(char) >= 0x2000
			let cc += 1
		endif
	endfor
	echo "Count of Chinese charasters is:"
	echo cc
	silent exec 'normal! '
endfunc

vnoremap <c-c> :call ChineseCount()<cr>
nnoremap <c-c> :call ChineseAboveCount()<cr>
inoremap <c-c> :call ChineseAboveCount()<cr>
"https://www.zhihu.com/question/54118781/answer/137982087

function! SequentialNumber()
  :'<,'>s/^/\=line('.')-1 /
endfunction


" ===
" === example
" ==========
function! PythonFunc()
python3 << endPython
synstackids = vim.eval("synstack(line('.'), col('.') - (col('.')>=2 ? 1 : 0))")
print(synstackids)
#texCodeZones = ['String']
#texCodeZoneIds = vim.eval('map('+str(texCodeZones)+", 'hlID(v:val)')")
#texCodeZoneIds = ['647']
#print(texCodeZoneIds)
#vimeval = vim.eval("synstack(line('.'), col('.') - (col('.')>=2 ? 1 : 0))")
#for i in vimeval:
#	print(i)#'\t' + vim.synIDattr(i,"name"))
endPython
endfunction
":call PythonFunc()


func! MyFunc()
	"echo "hello"
	":%s/^.*BookText">//
	"exec "!feh <cfile> &"
endfunc
"nnoremap <space>f :call MyFunc()<CR>

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! InkscapeForMarkdown() range
	let save = @z
	silent exec 'normal! "zya<'
	let text = @z
	let @z = save

	"https://stackoverflow.com/questions/12204192/using-multiple-delimiters-in-awk
	let svg_file = matchstr(text, '<img src=\([''"]\)\zs.\{-}\ze\1')
	if empty(svg_file) 
	   throw "no url recognized into ``".text."''"
	endif
	:echo svg_file
	:silent exec '!~/.config/nvim/scripts/my_inkscape.sh ' . svg_file
endfunc

autocmd Filetype markdown inoremap <C-f> <Esc>: silent exec '.!~/.config/nvim/scripts/my_inkscape.sh '. bufname() .' '. getline('.')<CR><CR>:w<CR>
autocmd Filetype markdown nnoremap <C-f> : call InkscapeForMarkdown()<CR><CR>
"":w<CR>


" ===
" === other
" ==========
"inoremap <C-f> <Esc>:silent !~/.config/nvim/scripts/screenshot.sh <cfile><CR>
"noremap <C-s> <Esc>:silent !~/.config/nvim/scripts/adb.sh<CR>p


nnoremap <space>RC :e ~/.config/nvim/init.vim<CR>
nnoremap <space>I3 :e ~/.config/i3/config<CR>
source ~/.config/nvim/scripts/python2to3.vim

" ===
" === Markdown
" ==========

"source ~/.config/nvim/markdown.vim

nnoremap <space><space> /<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown nnoremap <space>c Bi`<Esc>Ea`<Esc>
autocmd Filetype markdown nnoremap <space>m Bi$<Esc>Ea$<Esc>
autocmd Filetype markdown nnoremap <space>b Bi**<Esc>Ea**<Esc>
"autocmd Filetype markdown nnoremap <space>i bi*<Esc>ea*<Esc>
autocmd Filetype markdown nnoremap <space>z i✰<Esc>
"autocmd Filetype tex,markdown inoremap .<space> .<CR>
