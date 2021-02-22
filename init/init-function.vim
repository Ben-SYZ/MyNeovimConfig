" Compile function
nnoremap <space>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    "exec "!g++ % -o %<"
    exec "!gcc % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'zsh'
    :!time zsh %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term time python3 %
  elseif &filetype == 'html'
    exec "!chromium '%' &"
"  elseif &filetype == 'html'
"    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  elseif &filetype == 'mdp'
    exec "terminal mdp %"
  elseif &filetype == 'tex'
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


" ===
" === other
" ==========
inoremap <C-f> <Esc>:silent !~/.config/nvim/screenshot.sh <cfile><CR>
"noremap <C-s> <Esc>:silent !python ~/.config/nvim/adb.py<CR>p


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
