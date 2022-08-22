"======================================================================
"
" init-tabsize.vim - 大部分人对 tabsize 都有自己的设置，改这里即可
"
" Created by skywind on 2018/05/30
" Last Modified: 2020/12/17 15:05:16
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------

"set nosmarttab "neovim default on"
"
"" 设置缩进宽度 :normal >>
"set sw=8
"
"" 设置 TAB 宽度(多少个空格符号转成一个tab符)为了和其他编辑器保持一致
""set ts=4
"set tabstop=8
"
"" 禁止展开 tab (noexpandtab)(不把tab变成空格，虽然空格数到了ts但按tab键仍然显示空格)
"set expandtab
"
"" 如果后面设置了 expandtab 那么展开 tab 为多少字符
""（按一下tab bs(insert mode)进多少
"" sts=4, ts=8, 按两下tab 才会变成一个tab符
"set softtabstop=4

set smarttab
set shiftwidth=4
au FileType html set shiftwidth=2
set expandtab


augroup PythonTab
	au!
	" 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
	" 时自动设置成空格缩进。
	"au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END

