func! Print2ToPrint3()
	silent! %s/print\ \(.*,\?\)/print(\1)/
endfunc
