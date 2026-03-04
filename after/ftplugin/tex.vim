let g:tex_fast = 'bmMr'
let g:tex_no_error = 1
let g:tex_comment_nospell = 1
let g:tex_indent_brace = 0
let g:tex_indent_items = 0

let g:vimtex_delim_stopline = 200
let g:vimtex_matchparen_enabled = 0
let g:vimtex_imaps_enabled = 0
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = {
			\	'aux_dir': './__texout__',
			\	'out_dir': '.',
			\	'callback': 1,
			\	'continuous': 1,
			\	'executable': 'latexmk',
			\	'options': [
			\		'-verbose',
			\		'-file-line-error',
			\		'-interaction=nonstopmode'
			\	]
			\}

" use local documentations instead of online one
function! TexDoc(context) abort
	call vimtex#doc#make_selection(a:context)
	if !empty(a:context.selected)
		silent execute '!texdoc' a:context.selected '&'
	endif
	return 1
endfunction
let g:vimtex_doc_handlers = ['TexDoc']

imap <buffer> <C-B> <plug>(vimtex-delim-close)
