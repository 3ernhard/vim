if !exists('g:did_coc_loaded') || g:did_coc_loaded > 1
	finish
endif

augroup COC_SETTINGS
	" Highlight the symbol and its references when holding the cursor.
	autocmd! CursorHold * silent call CocActionAsync('highlight')
	" Setup formatexpr specified filetype(s).
	autocmd! FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd! User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

set updatetime=300
set shortmess+=c

" Navigate diagnostics, use `:CocDiagnostics` to get all diagnostics
" of current buffer in location list.
nmap <silent> [w <Plug>(coc-diagnostic-prev)
nmap <silent> ]w <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)
nmap <silent> <Leader>d <Plug>(coc-diagnostic-info)
nmap <silent> <Leader>D <C-\><C-N>:CocDiagnostics<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <Leader>cr <Plug>(coc-rename)

" Formatting selected code.
xmap <Leader>cf <Plug>(coc-format-selected)
nmap <Leader>cf <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<Leader>aap` for current paragraph
xmap <Leader>ca <Plug>(coc-codeaction-selected)
nmap <Leader>ca <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <Leader>cA <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <Leader>cF <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-S> <Plug>(coc-range-select)
xmap <silent> <C-S> <Plug>(coc-range-select)

" Remap <C-F> and <C-B> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <S-Up>   coc#pum#visible() \|\| coc#float#has_scroll() ? coc#float#scroll(0) : '<S-Up>'
nnoremap <silent><nowait><expr> <S-Down> coc#pum#visible() \|\| coc#float#has_scroll() ? coc#float#scroll(1) : '<S-Down>'
vnoremap <silent><nowait><expr> <S-Up>   coc#pum#visible() \|\| coc#float#has_scroll() ? coc#float#scroll(0) : '<S-Up>'
vnoremap <silent><nowait><expr> <S-Down> coc#pum#visible() \|\| coc#float#has_scroll() ? coc#float#scroll(1) : '<S-Down>'
inoremap <silent><nowait><expr> <S-Up>   coc#pum#visible() \|\| coc#float#has_scroll() ? '<C-R>=coc#float#scroll(0)<CR>' : '<S-Up>'
inoremap <silent><nowait><expr> <S-Down> coc#pum#visible() \|\| coc#float#has_scroll() ? '<C-R>=coc#float#scroll(1)<CR>' : '<S-Down>'

" Use <Up> and <Down> to navigate completion list.
inoremap <silent><expr> <Up>    coc#pum#visible() ? coc#pum#prev(1) : pumvisible() ? '<C-P>' : '<C-O>g<Up>'
inoremap <silent><expr> <Down>  coc#pum#visible() ? coc#pum#next(1) : pumvisible() ? '<C-N>' : '<C-O>g<Down>'

if has('gui_running') || has('nvim')
	inoremap <silent><expr> <C-Space> coc#pum#has_item_selected() ? coc#pum#confirm() : pumvisible() ? '<C-Y>' : coc#refresh()
else
	inoremap <silent><expr> <C-@>     coc#pum#has_item_selected() ? coc#pum#confirm() : pumvisible() ? '<C-Y>' : coc#refresh()
endif

let g:coc_snippet_next = '<C-Right>'
let g:coc_snippet_prev = '<C-Left>'

" Notify coc.nvim that <CR> has been pressed.
inoremap <silent> <CR> <CR><C-R>=coc#on_enter()<CR>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

function! s:show_documentation() abort
	if index(['vim', 'help'], &filetype) >= 0
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!'.&keywordprg." ".expand('<cword>')
	endif
endfunction
noremap <silent> K :call <SID>show_documentation()<CR>

function! CocStatusErrors() abort
	let info = get(b:, 'coc_diagnostic_info', {})
	return get(info, 'error', 0) ? ' '.info['error'].'E ' : ''
endfunction
function! CocStatusWarnings() abort
	let info = get(b:, 'coc_diagnostic_info', {})
	return get(info, 'warning', 0) ? ' '.info['warning'].'W ' : ''
endfunction

set statusline+=%(\ %(%#ErrorStatusline#%{CocStatusErrors()}%*%)%(%#WarningStatusline#%{CocStatusWarnings()}%*%)%)
