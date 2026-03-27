augroup filetypedetect
	autocmd! BufNewFile,BufRead *.lst set filetype=
	autocmd! BufNewFile,BufRead *.csv setfiletype csv
	autocmd! BufNewFile,BufRead *.tsv setfiletype tsv
augroup END
