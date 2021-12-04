"======================================================================
"
" init-config.vim - 正常模式下的配置，在 init-basic.vim 后调用
"
" Created by skywind on 2018/05/30
" Last Modified: 2020/12/17 14:41:30
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 有 tmux 何没有的功能键超时（毫秒）
"----------------------------------------------------------------------
if $TMUX != ''
	set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
	set ttimeoutlen=80
endif


"----------------------------------------------------------------------
" 终端下允许 ALT，详见：http://www.skywind.me/blog/archives/2021
" 记得设置 ttimeout （见 init-basic.vim） 和 ttimeoutlen （上面）
"----------------------------------------------------------------------
if has('nvim') == 0 && has('gui_running') == 0
	function! s:metacode(key)
		exec "set <M-".a:key.">=\e".a:key
	endfunc
	for i in range(10)
		call s:metacode(nr2char(char2nr('0') + i))
	endfor
	for i in range(26)
		call s:metacode(nr2char(char2nr('a') + i))
		call s:metacode(nr2char(char2nr('A') + i))
	endfor
	for c in [',', '.', '/', ';', '{', '}']
		call s:metacode(c)
	endfor
	for c in ['?', ':', '-', '_', '+', '=', "'"]
		call s:metacode(c)
	endfor
endif


"----------------------------------------------------------------------
" 终端下功能键设置
"----------------------------------------------------------------------
function! s:key_escape(name, code)
	if has('nvim') == 0 && has('gui_running') == 0
		exec "set ".a:name."=\e".a:code
	endif
endfunc


"----------------------------------------------------------------------
" 功能键终端码矫正
"----------------------------------------------------------------------
call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
call s:key_escape('<S-F1>', '[1;2P')
call s:key_escape('<S-F2>', '[1;2Q')
call s:key_escape('<S-F3>', '[1;2R')
call s:key_escape('<S-F4>', '[1;2S')
call s:key_escape('<S-F5>', '[15;2~')
call s:key_escape('<S-F6>', '[17;2~')
call s:key_escape('<S-F7>', '[18;2~')
call s:key_escape('<S-F8>', '[19;2~')
call s:key_escape('<S-F9>', '[20;2~')
call s:key_escape('<S-F10>', '[21;2~')
call s:key_escape('<S-F11>', '[23;2~')
call s:key_escape('<S-F12>', '[24;2~')


"----------------------------------------------------------------------
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------
"if &term =~ '256color' && $TMUX != ''
"	" disable Background Color Erase (BCE) so that color schemes
"	" render properly when inside 256-color tmux and GNU screen.
"	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
"	set t_ut=
"endif


"----------------------------------------------------------------------
" 备份设置
"----------------------------------------------------------------------

" 允许备份
set backup

" 保存时备份
set writebackup

" 备份文件地址，统一管理
set backupdir=~/.vim/tmp

" 备份文件扩展名
set backupext=.bak

" 禁用交换文件
"set noswapfile

" 禁用 undo文件
"set noundofile

"自动保存
set autowrite
"自动切换当前目录为当前文件所在的目录
set autochdir

" 和系统共享剪切板
set clipboard+=unnamedplus " clipboard for system
"vnoremap Y "+y
"let g:clipboard = {
"  \   'name': 'myClipboard',
"  \   'copy': {
"  \      '+': 'tmux load-buffer -',
"  \      '*': 'tmux load-buffer -',
"  \    },
"  \   'paste': {
"  \      '+': 'tmux save-buffer -',
"  \      '*': 'tmux save-buffer -',
"  \   },
"  \   'cache_enabled': 1,
"  \ }

" 创建目录，并且忽略可能出现的警告
silent! call mkdir(expand('~/.vim/tmp'), "p", 0755)


"----------------------------------------------------------------------
" 配置微调
"----------------------------------------------------------------------

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" 定义一个 DiffOrig 命令用于查看文件改动
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif



"----------------------------------------------------------------------
" 文件类型微调
"----------------------------------------------------------------------
augroup InitFileTypesGroup

	" 清除同组的历史 autocommand
	au!

	" C/C++ 文件使用 // 作为注释
	au FileType c,cpp setlocal commentstring=//\ %s

	" markdown 允许自动换行
	au FileType markdown setlocal wrap


	"" lisp 进行微调
	"au FileType lisp setlocal ts=8 sts=2 sw=2 et

	"" scala 微调
	"au FileType scala setlocal sts=4 sw=4 noet

	"" haskell 进行微调
	"au FileType haskell setlocal et

	"" quickfix 隐藏行号
	"au FileType qf setlocal nonumber

	" 强制对某些扩展名的 filetype 进行纠正
	au BufNewFile,BufRead *.as setlocal filetype=actionscript
	au BufNewFile,BufRead *.pro setlocal filetype=prolog
	au BufNewFile,BufRead *.es setlocal filetype=erlang
	au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
	au BufNewFile,BufRead *.vl setlocal filetype=verilog
	au BufRead,BufNewFile *.mdp setfiletype mdp
	au BufNewFile,BufRead *.wiki setf Wikipedia 

augroup END


"----------------------------------------------------------------------
" 语法检查
"----------------------------------------------------------------------
au FileType markdown setlocal spell
set spelllang=en_us,cjk
setlocal spellfile=~/.config/nvim/spell/en.utf-8.add
"if &filetype == 'markdown'
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
