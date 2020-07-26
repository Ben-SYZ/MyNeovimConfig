function! Py4eToMdFunction()
	silent! .s/<\/*p>//g
	silent! .s/<\/*code>/`/g
	silent! .s/<\/*em>/*/g
endfunction

command! Py4eToMd call Py4eToMdFunction()
